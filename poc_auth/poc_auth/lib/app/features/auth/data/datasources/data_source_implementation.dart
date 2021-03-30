import 'package:poc_auth/app/core/errors/exeption.dart';
import 'package:poc_auth/app/features/auth/data/models/succes_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'data_source.dart';

class DataSourceImplementation implements IDataSource {
  final FirebaseAuth auth;

  DataSourceImplementation(this.auth);

  @override
  Future<SuccessModel> logout() async {
    try {
      await auth.signOut();
      return SuccessModel(message: 'Você saiu do app!');
    } on FirebaseException catch (error) {
      throw ServerException(message: error.message!);
    } catch (_) {
      throw LogOutException(message: 'Algum erro aconteceu');
    }
  }

  @override
  Future<SuccessModel> signInWitEmailandPassword(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return SuccessModel(message: 'Você entrou no app');
    } on FirebaseException catch (error) {
      if (error.code == 'auth/invalid-email') {
        throw InvalidEmailException(
          message: error.message!,
        );
      } else if (error.code == 'auth/invalid-password') {
        throw InvalidPasswordException(
          message: error.message!,
        );
      } else if (error.code == 'servidor auth/internal-error') {
        throw ServerException(
          message: error.message!,
        );
      } else {
        throw AuthGenericException(
          message: error.message!,
        );
      }
    }
  }
}
