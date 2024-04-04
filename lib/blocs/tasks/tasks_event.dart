import 'package:notes/data/models/task_model.dart';

abstract class TasksEvent {}

class GetTasksEvent extends TasksEvent {}

class AddTaskEvent extends TasksEvent {
  final TaskModel taskModel;

  AddTaskEvent({required this.taskModel});
}

class DeleteTaskEvent extends TasksEvent {
  final int id;

  DeleteTaskEvent({required this.id});
}

class UpdateTaskEvent extends TasksEvent {
  final TaskModel taskModel;
  final int id;

  UpdateTaskEvent({required this.taskModel, required this.id});
}
class SearchTaskEvent extends TasksEvent{}
