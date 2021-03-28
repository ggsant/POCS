import 'package:poc_auth/app/core/connection/connectivity.dart';
import 'package:poc_auth/app/core/errors/exeption.dart';
import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:poc_auth/app/features/auth/data/datasources/data_source.dart';
import 'package:poc_auth/app/features/auth/data/models/succes_model.dart';
import 'package:poc_auth/app/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class IDataSourceMock extends Mock implements IDataSource {}

class IConnectivityMock extends Mock implements IConnectivity {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthRepositoryImplementation repository;
  late IDataSourceMock dataSource;
  late SuccessModel tSuccessModel;
  final tEmail = 'teste';
  final tPassword = '1234567';

  setUp(() {
    dataSource = IDataSourceMock();
    repository = AuthRepositoryImplementation(
      remoteDataSource: dataSource,
    );
    tSuccessModel = SuccessModel(message: 'Return UserModel');
  });

  group('Sign In group:', () {
    test(
        'Should return SuccessModel from auth repository when SignIn in process done successfully',
        () async {
      //* arrange
      when(
        () => dataSource.signInWitEmailandPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => tSuccessModel);
      //? act
      final result = await repository.signInWithEmailAndPassword(
          email: tEmail, password: tPassword);
      //! assert
      verify(
        () => dataSource.signInWitEmailandPassword(
          email: tEmail,
          password: tPassword,
        ),
      ).called(1);
      expect(result, Right(tSuccessModel));
    });

    test(
        'Should return ServerFailure from auth repository when ServerException throw',
        () async {
      //* arrange
      when(
        () => dataSource.signInWitEmailandPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
          ServerException(message: 'Algum erro aconteceu, tente novamente!'));
      //? act
      final result = await repository.signInWithEmailAndPassword(
        email: tEmail,
        password: tPassword,
      );
      //! assert
      verify(
        () => dataSource.signInWitEmailandPassword(
          email: tEmail,
          password: tPassword,
        ),
      ).called(1);
      expect(
        result,
        Left(
          ServerFailure(message: 'Algum erro aconteceu, tente novamente!'),
        ),
      );
    });

    test(
        'Should return InvalidEmailException from auth repository when InvalidEmailFailure throw',
        () async {
      //* arrange
      when(
        () => dataSource.signInWitEmailandPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(InvalidEmailException(
        message: 'Seu e-mail está inválido, tente novamente!',
      ));
      //? act
      final result = await repository.signInWithEmailAndPassword(
        email: tEmail,
        password: tPassword,
      );
      //! assert
      verify(
        () => dataSource.signInWitEmailandPassword(
          email: tEmail,
          password: tPassword,
        ),
      ).called(1);
      expect(
        result,
        Left(
          InvalidEmailFailure(
            message: 'Seu e-mail está inválido, tente novamente!',
          ),
        ),
      );
    });

    test(
        'Should return InvalidPasswordFailure from auth repository when InvalidPasswordException throw',
        () async {
      //* arrange
      when(
        () => dataSource.signInWitEmailandPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(InvalidPasswordException(
          message: 'Sua senha é invalida, tente novamente'));
      //? act
      final result = await repository.signInWithEmailAndPassword(
        email: tEmail,
        password: tPassword,
      );
      //! assert
      expect(
        result,
        Left(
          InvalidPasswordFailure(
              message: 'Sua senha é invalida, tente novamente'),
        ),
      );
    });
  });

  group('Logout group:', () {
    test('Should Logout Successfully', () async {
      //* arrange
      when(() => dataSource.logout()).thenAnswer((_) async => tSuccessModel);
      //? act
      var result = await repository.logout();
      //! assert
      expect(result, isA<Right>());
    });

    test('Should return ServerFailure when firebase failed to logout the user',
        () async {
      //* arrange
      when(() => dataSource.logout()).thenThrow(
        ServerException(message: 'Algum erro aconteceu, tente novamente!'),
      );
      //? act
      var result = await repository.logout();
      //! assert
      // expect(result, isA<Left>());
      expect(
          result,
          Left(ServerFailure(
              message: 'Algum erro aconteceu, tente novamente!')));
    });

    test('Should return CacheFailure when something want wrong', () async {
      //* arrange
      when(() => dataSource.logout()).thenThrow(
        CacheException(message: 'Algum erro aconteceu, tente novamente!'),
      );
      //? act
      final result = await repository.logout();
      //! assert
      expect(
          result,
          Left(
              CacheFailure(message: 'Algum erro aconteceu, tente novamente!')));
    });
  });
}
