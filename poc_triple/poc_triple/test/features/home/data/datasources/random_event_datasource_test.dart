import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_triple/app/core/http_client/http_client.dart';
import 'package:poc_triple/app/features/home/data/datasources/random_event_datasource_impl.dart';
import 'package:poc_triple/app/features/home/data/models/random_event_model.dart';

class MockHttpClient extends Mock implements ApiClient {}

void main() {
  late MockHttpClient httpClient;
  late RandomEventDatasourceImpl datasource;

  setUp(() {
    httpClient = MockHttpClient();
    datasource = RandomEventDatasourceImpl(client: httpClient);
  });

  final tRandomEvent = RandomEventModel(
    activity: "Learn Express.js",
    accessibility: 0.25,
    type: "education",
    participants: 1,
    price: 0.1,
    link: "https://expressjs.com/",
    key: "3943506",
  );

  const randomEventJsonMock = {
    "activity": "Learn Express.js",
    "accessibility": 0.25,
    "type": "education",
    "participants": 1,
    "price": 0.1,
    "link": "https://expressjs.com/",
    "key": "3943506"
  };

  group('description', () {
    test('should cal the getTrending method and return the model', () async {
      //*arrange
      when(() => httpClient.getJSONdata())
          .thenAnswer((_) async => randomEventJsonMock);
      //?act
      final result = await datasource.getRandomEvent();
      //!assert
      expect(result, equals(tRandomEvent));
    });
  });
}
