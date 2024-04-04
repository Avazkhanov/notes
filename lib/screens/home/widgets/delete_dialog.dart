import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/blocs/tasks/tasks_block.dart';
import 'package:notes/blocs/tasks/tasks_event.dart';
import 'package:notes/utils/colors/app_colors.dart';
import 'package:notes/utils/styles/app_style.dart';

deleteDialog(
{
  required BuildContext context,
  required int id
}
){
  return AlertDialog(
    backgroundColor: AppColors.c_252525,
    title: Text('Delete Task',style: AppStyle.interNunitoBold.copyWith(fontSize: 18.sp)),
    content: Text('Are you sure you want to delete this task?',style: AppStyle.interNunitoRegular.copyWith(fontSize: 14.sp)),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          context.read<TasksBloc>().add(DeleteTaskEvent(id: id));
          Navigator.of(context).pop();
        },
        child: Text('Delete'),
      ),
    ],
  );
}