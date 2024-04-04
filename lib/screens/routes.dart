import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/data/models/task_model.dart';
import 'package:notes/screens/add_tasks/add_task_screen.dart';
import 'package:notes/screens/home/home_screen.dart';
import 'package:notes/screens/update_task/update_task_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return navigate(const HomeScreen());
      case RoutesName.add:
        return navigate(const AddTaskScreen());

      case RoutesName.edit:
        return navigate(
            UpdateTaskScreen(taskModel: settings.arguments as TaskModel));

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget);
  }
}

class RoutesName {
  static const String home = '/home';
  static const String add = '/add';
  static const String edit = '/edit';
  static const String search = '/search';
}
