import 'package:equatable/equatable.dart';

class SignInCredentialsEntity extends Equatable {
  final String email;
  final String password;

  SignInCredentialsEntity({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
