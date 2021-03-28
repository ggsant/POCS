import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/pages/sign_in_widget.dart';

class SignInModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SignInWiget()),
  ];
}
