import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/blocs/tasks/tasks_event.dart';
import 'package:notes/blocs/tasks/tasks_state.dart';
import 'package:notes/data/database/local_database.dart';
import 'package:notes/data/models/task_model.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitialState()) {
    on<GetTasksEvent>(_getTasks);
    on<AddTaskEvent>(_addTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<UpdateTaskEvent>(_updateTask);
    on<SearchTaskEvent>(_searchTask);
  }

  Future<void> _getTasks(GetTasksEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoadingState());
    List<TaskModel> tasks = await LocalDatabase.getAllTasks();

    if (tasks.isEmpty) {
      emit(TasksEmptyState());
    } else {
      emit(TasksSuccessState(tasks: tasks));
    }
  }

  Future<void> _searchTask(
      SearchTaskEvent event, Emitter<TasksState> emit) async {
    try {
      final List<TaskModel> tasks = await LocalDatabase.getAllTasks();
      emit(SearchTaskState(allTasks: tasks));
    } catch (e) {
      emit(TasksErrorState(message: e.toString()));
    }
  }

  Future<void> _addTask(AddTaskEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoadingState());
    TaskModel task = event.taskModel;
    await LocalDatabase.insertTask(task);
    emit(TasksSuccessState(tasks: await LocalDatabase.getAllTasks()));
  }

  Future<void> _deleteTask(
      DeleteTaskEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoadingState());
    int id = event.id;
    await LocalDatabase.deleteTask(id);
    List<TaskModel> tasks = await LocalDatabase.getAllTasks();

    if (tasks.isEmpty) {
      emit(TasksEmptyState());
    } else {
      emit(TasksSuccessState(tasks: tasks));
    }
  }

  Future<void> _updateTask(
      UpdateTaskEvent event, Emitter<TasksState> emit) async {
    emit(TasksLoadingState());
    TaskModel task = event.taskModel;
    int id = event.id;
    await LocalDatabase.updateTask(task, id);
    emit(TasksSuccessState(tasks: await LocalDatabase.getAllTasks()));
  }
}
