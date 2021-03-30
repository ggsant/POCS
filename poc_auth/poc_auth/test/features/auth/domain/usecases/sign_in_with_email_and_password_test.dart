import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:poc_auth/app/features/auth/domain/entities/login_credentials.dart';
import 'package:poc_auth/app/features/auth/domain/entities/success_entity.dart';
import 'package:poc_auth/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:poc_auth/app/features/auth/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late SignInWithEmailAndPassword usecase;
  setUp(() {
    repository = MockAuthRepository();
    usecase = SignInWithEmailAndPassword(repository: repository);
  });

  final tUserCredentials =
      SignInCredentialsEntity(email: 'test@mail.com', password: '1234567');

  final tUserInvalidEmail =
      SignInCredentialsEntity(email: 'tesrt', password: '123');

  final tSuccess = SuccessEntity(message: 'Usuário logado');

  final tInvalidEmailFailure = InvalidEmailFailure(message: 'Invalid email');

  test('Should call SignIn method from auth repository', () async {
    //* arrange
    when(
      () => repository.signInWithEmailAndPassword(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => Right(tSuccess));
    //? act
    final response = await usecase(tUserCredentials);
    //! assert
    expect(response, Right(tSuccess));
    verify(
      () => repository.signInWithEmailAndPassword(
        email: tUserCredentials.email,
        password: tUserCredentials.password,
      ),
    ).called(1);
  });

  test('Should verify if email is not valid', () async {
    //* arrange
    when(() => repository.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => Left(tInvalidEmailFailure));

    //? act
    final response = await usecase(tUserInvalidEmail);

    //! assert
    expect(response, Left(tInvalidEmailFailure));
    verifyNever(
      () => repository.signInWithEmailAndPassword(
        email: tUserCredentials.email,
        password: tUserCredentials.password,
      ),
    );
  });
}
