import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:mocktail/mocktail.dart';

class UserInfoMock extends Mock implements UserInfo {}

class FirebaseAuthPlatformMock extends Mock implements FirebaseAuthPlatform {}

class AuthCredentialMock extends Mock implements AuthCredential {}
