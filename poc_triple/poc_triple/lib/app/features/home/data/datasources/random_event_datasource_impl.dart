import 'package:poc_triple/app/core/errors/exeptions/exeptions.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';
import 'package:poc_triple/app/core/http_client/http_client.dart';
import 'package:poc_triple/app/features/home/data/datasources/random_event_datasource_abs.dart';
import 'package:poc_triple/app/features/home/data/models/random_event_model.dart';

class RandomEventDatasourceImpl extends IRandomEventDatasource {
  final ApiClient client;

  RandomEventDatasourceImpl({required this.client});

  @override
  Future<RandomEventModel> getRandomEvent() async {
    try {
      final response = await client.getJSONdata();
      print(response);
      return RandomEventModel.fromJson(response);
    } on ServerException {
      throw ServerFailure();
    }
  }
}
