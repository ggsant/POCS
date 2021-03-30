import 'package:poc_auth/app/core/usecase/usecase.dart';
import 'package:poc_auth/app/features/auth/domain/entities/success_entity.dart';
import 'package:poc_auth/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:poc_auth/app/features/auth/domain/usecases/logout.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late LogoutUseCase usecase;

  setUp(() {
    repository = MockAuthRepository();
    usecase = LogoutUseCase(repository: repository);
  });

  final tSuccess = SuccessEntity(message: 'Desconectado');

  final tNoParams = NoParams();

  test('Should logout the user', () async {
    //* arrange
    when(() => repository.logout()).thenAnswer((_) async => Right(tSuccess));
    //? act
    final response = await usecase(tNoParams);
    //! assert
    expect(response, Right(tSuccess));
    verify(() => repository.logout());
  });
}
