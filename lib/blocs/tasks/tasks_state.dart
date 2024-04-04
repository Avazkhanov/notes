import 'package:notes/data/models/task_model.dart';

abstract class TasksState {}

class TasksInitialState extends TasksState {}

class TasksLoadingState extends TasksState {}

class TasksSuccessState extends TasksState {
  final List<TaskModel> tasks;

  TasksSuccessState({required this.tasks});
}

class TasksErrorState extends TasksState {
  final String message;

  TasksErrorState({required this.message});
}

class TasksEmptyState extends TasksState {}

class SearchTaskState extends TasksState {
  final List<TaskModel> allTasks;

  SearchTaskState({required this.allTasks});
}
