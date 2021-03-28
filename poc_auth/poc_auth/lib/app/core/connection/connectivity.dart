import 'package:poc_auth/app/core/connection/success_connectivity.dart';
import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IConnectivity {
  Future<bool> get isConnect;
}

abstract class IConnectivityService {
  Future<Either<ConnectionFailure, SuccessConnectivity>> isOnline();
}
