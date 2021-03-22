import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failures/failures.dart';
import 'package:todo_app/features/home/domain/entities/task_entity.dart';

abstract class TodoRepositoryAbs {
  Future<Either<Failure, TaskEntity>> getTask();
  Future<Either<Failure, TaskEntity>> addTarefas(String task);
}
