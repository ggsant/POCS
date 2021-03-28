import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  ServerException({required this.message});
  @override
  List<Object?> get props => [message];
}

class InvalidEmailException extends Equatable implements Exception {
  final String message;

  InvalidEmailException({required this.message});
  @override
  List<Object?> get props => [message];
}

class InvalidPasswordException extends Equatable implements Exception {
  final String message;

  InvalidPasswordException({required this.message});
  @override
  List<Object?> get props => [message];
}

class AuthException extends Equatable implements Exception {
  final String message;

  AuthException({required this.message});
  @override
  List<Object?> get props => [message];
}

class LogOutException extends Equatable implements Exception {
  final String message;

  LogOutException({required this.message});
  @override
  List<Object?> get props => [message];
}

class CacheException extends Equatable implements Exception {
  final String message;

  CacheException({required this.message});
  @override
  List<Object?> get props => [message];
}

class AuthGenericException extends Equatable implements Exception {
  final String message;

  AuthGenericException({required this.message});
  @override
  List<Object?> get props => [message];
}
