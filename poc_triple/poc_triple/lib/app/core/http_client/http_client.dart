import 'dart:convert';

import 'package:http/http.dart';
import 'package:poc_triple/app/core/errors/exeptions/exeptions.dart';

class ApiClient {
  final Client client;

  ApiClient({required this.client});

  dynamic getJSONdata() async {
    final response = await client.get(
      Uri.parse('http://www.boredapi.com/api/activity/'),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServerException();
    }
  }
}
