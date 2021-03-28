import 'package:poc_auth/app/core/connection/connectivity.dart';
import 'package:poc_auth/app/core/connection/success_connectivity.dart';
import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class ConnectivityImplements implements IConnectivityService {
  final IConnectivity connectivity;

  ConnectivityImplements({required this.connectivity});

  @override
  Future<Either<ConnectionFailure, SuccessConnectivity>> isOnline() async {
    try {
      var checkConnection = await connectivity.isConnect;
      if (checkConnection) {
        return Right(SuccessConnectivity(message: 'Usuário connectado'));
      }
      throw ConnectionFailure(message: 'Usuário desconectado');
    } on ConnectionFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ConnectionFailure(
          message: 'Erro ao recuperar a informaçao da conexão.'));
    }
  }
}
