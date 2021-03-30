import 'package:poc_auth/app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required String email, required String id})
      : super(email: email, id: id);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json.containsKey('id') ? json['id'] : null,
        email: json.containsKey('email') ? json['email'] : null,
      );

  Map<String, dynamic> toJson() => {'id': id, 'email': email};

  factory UserModel.fromEntity(UserEntity entity) =>
      UserModel(email: entity.email, id: entity.id);
}
