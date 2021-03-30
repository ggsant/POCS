import 'package:poc_auth/app/core/errors/exeption.dart';
import 'package:poc_auth/app/features/auth/data/datasources/data_source_implementation.dart';
import 'package:poc_auth/app/features/auth/data/models/succes_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DataSourceImplementationMock extends Mock
    implements DataSourceImplementation {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

void main() {
  late FirebaseAuth auth;

  late DataSourceImplementation dataSource;

  setUp(() {
    auth = FirebaseAuthMock();
    dataSource = DataSourceImplementation(auth);
  });

  final tEmail = 'teste@test.com';

  final tPassword = '1234567';

  final tWrongEmail = 'teste';

  final tWrongPassword = '1234';

  group('SignIn group:', () {
    test('Should return SuccessModel if it is success', () async {
      //* arrange
      when(() => auth.signInWithEmailAndPassword(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => UserCredentialMock());
      //? act
      final result = await dataSource.signInWitEmailandPassword(
          email: tEmail, password: tPassword);
      //! assert
      expect(result, SuccessModel(message: 'Você entrou no app'));
    });

    test(
        'Should return InvalidEmailException if (error.code == auth/invalid-email)',
        () async {
      //* arrange
      when(() => auth.signInWithEmailAndPassword(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenThrow(FirebaseException(
              code: 'auth/invalid-email', plugin: '', message: 'Deu ruim'));
      //? act
      final result = dataSource.signInWitEmailandPassword(
          email: tWrongEmail, password: tPassword);
      //! assert
      expect(() => result, throwsA(isA<InvalidEmailException>()));
      verify(() => auth.signInWithEmailAndPassword(
          email: tWrongEmail, password: tPassword)).called(1);
    });

    test(
        'Should return InvalidPasswordException if  (error.code == auth/invalid-password)',
        () async {
      //* arrange
      when(() => auth.signInWithEmailAndPassword(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenThrow(FirebaseException(
              code: 'auth/invalid-password', plugin: '', message: 'Deu ruim2'));
      //? act
      final result = dataSource.signInWitEmailandPassword(
          email: tEmail, password: tWrongPassword);
      //! assert
      expect(() => result, throwsA(isA<InvalidPasswordException>()));
      verify(() => auth.signInWithEmailAndPassword(
          email: tEmail, password: tWrongPassword)).called(1);
    });

    test(
        'Should return InvalidEmailException if  (error.code == servidor auth/internal-error)',
        () async {
      //* arrange
      when(() => auth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'))).thenThrow(FirebaseException(
        code: 'servidor auth/internal-error',
        plugin: '',
        message: 'Deu ruim3',
      ));
      //? act
      final result = dataSource.signInWitEmailandPassword(
          email: tWrongEmail, password: tPassword);
      //! assert
      expect(() => result, throwsA(isA<ServerException>()));
      verifyNever(() =>
          auth.signInWithEmailAndPassword(email: tEmail, password: tPassword));
    });

    test('Should return AuthGenericException when it is a generic mistake',
        () async {
      //* arrange
      when(() => auth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'))).thenThrow(FirebaseException(
        plugin: '',
        message: 'Deu ruim4',
      ));
      //? act
      final result = dataSource.signInWitEmailandPassword(
          email: tWrongEmail, password: tWrongPassword);
      //! assert
      expect(() => result, throwsA(isA<AuthGenericException>()));
      verifyNever(() =>
          auth.signInWithEmailAndPassword(email: tEmail, password: tPassword));
    });
  });
}
