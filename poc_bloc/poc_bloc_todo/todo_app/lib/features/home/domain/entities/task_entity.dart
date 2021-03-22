import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TaskEntity extends Equatable {
  final String task;

  TaskEntity({
    @required this.task,
  });

  @override
  List<Object> get props => [task];
}
