import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/fetch_credential_usecase.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/pages/home/home_fetch_store.dart';
import 'package:triple_test/triple_test.dart';

class FetchCredentialUseCaseMock extends Mock implements FetchCredentialUseCase {}

void main() {
  late FetchCredentialUseCaseMock usecase;

  setUpAll(() {
    usecase = FetchCredentialUseCaseMock();
  });

  group('HomeFetchStore', () {
    storeTest<HomeFetchStore>(
      'Should call the store',
      build: () {
        when(() => usecase.call()).thenAnswer((_) async => Right(const [CredentialResult('title', 'appId', 'token', 'id')]));
        return HomeFetchStore(usecase);
      },
      act: (store) => store.fetchCredentials(),
      expect: () => [
        tripleState,
        true,
        const [CredentialResult('title', 'appId', 'token', 'id')],
        false
      ],
      verify: (store) {
        verify(() => usecase.call()).called(1);
      },
    );

    storeTest<HomeFetchStore>(
      'Should return DataSourceFailure ',
      build: () {
        when(() => usecase.call()).thenAnswer((_) async => Left(const DataSourceCredentialFailure('Error')));
        return HomeFetchStore(usecase);
      },
      act: (store) => store.fetchCredentials(),
      expect: () => [tripleState, true, const DataSourceCredentialFailure('Error'), false],
      verify: (store) {
        verify(() => usecase.call()).called(1);
      },
    );
  });
}
