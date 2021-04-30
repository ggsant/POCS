import 'package:dartz/dartz.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
