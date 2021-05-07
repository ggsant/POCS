import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';

class CredentialAdapters {
  static CredentialResult fromJson(Map json) => CredentialResult(
        json["title"],
        json["appId"],
        json["token"],
        json["id"],
      );

  static Map toJson(CredentialResult credential) => {
        'title': credential.title,
        'appId': credential.appId,
        'token': credential.token,
        'id': credential.id,
      };
}
