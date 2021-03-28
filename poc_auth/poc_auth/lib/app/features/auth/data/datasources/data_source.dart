import 'package:poc_auth/app/features/auth/data/models/succes_model.dart';

abstract class IDataSource {
  Future<SuccessModel> signInWitEmailandPassword({
    required String email,
    required String password,
  });

  Future<SuccessModel> logout();
}
