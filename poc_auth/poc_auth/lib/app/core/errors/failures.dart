import 'package:equatable/equatable.dart';

//! https://firebase.google.com/docs/auth/admin/errors

abstract class Failure extends Equatable {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class InvalidEmailFailure extends Failure {
  InvalidEmailFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class InvalidPasswordFailure extends Failure {
  InvalidPasswordFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class InvalidCredentialdFailure extends Failure {
  InvalidCredentialdFailure({required String message})
      : super(message: message);

  @override
  List<Object?> get props => [message];
}

class LogOutFailure extends Failure {
  LogOutFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends Failure {
  AuthFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}
