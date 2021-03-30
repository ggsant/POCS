import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/data/datasources/data_source_implementation.dart';
import 'features/auth/data/repositories/auth_repository_implementation.dart';
import 'features/auth/domain/usecases/logout.dart';
import 'features/auth/domain/usecases/sign_in_with_email_and_password.dart';
import 'features/auth/presentation/controller/sign_in_controller.dart';
import 'features/auth/sign_in_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignInController(i())),
    Bind.lazySingleton((i) => SignInWithEmailAndPassword(repository: i())),
    Bind.lazySingleton((i) => LogoutUseCase(repository: i())),
    Bind.lazySingleton(
        (i) => AuthRepositoryImplementation(remoteDataSource: i())),
    Bind.lazySingleton((i) => DataSourceImplementation(FirebaseAuth.instance)),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SignInModule()),
  ];
}
