import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/blocs/tasks/tasks_block.dart';
import 'package:notes/blocs/tasks/tasks_event.dart';
import 'package:notes/data/models/task_model.dart';
import 'package:notes/screens/add_tasks/widgets/add_textfield.dart';
import 'package:notes/screens/globals/global_ink.dart';
import 'package:notes/utils/colors/app_colors.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    List<Color> colors = [
      AppColors.c_FF9E9E,
      AppColors.c_91F48F,
      AppColors.c_FFF599,
      AppColors.c_9EFFFF,
      AppColors.c_B69CFF,
      AppColors.c_30BE71,
      AppColors.c_CCFF80,
    ];
    return Scaffold(
      backgroundColor: AppColors.c_252525,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.c_252525,
        actions: [
          SizedBox(width: 10.w),
          GlobalInk(
            icon: Icons.arrow_back_ios,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          GlobalInk(
            icon: Icons.remove_red_eye_outlined,
            onTap: () {},
          ),
          SizedBox(width: 10.w),
          GlobalInk(
            icon: Icons.save_rounded,
            onTap: () async {
              var random = Random().nextInt(colors.length);
              TaskModel task = TaskModel(
                id: 0,
                title: titleController.text,
                description: descriptionController.text,
                color: colors[random],
              );
              context.read<TasksBloc>().add(AddTaskEvent(taskModel: task));
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 25.h),
              AddTextField(
                  text: "Title", controller: titleController, isTitle: true),
              SizedBox(height: 25.h),
              AddTextField(
                  text: "Type something...",
                  controller: descriptionController,
                  isTitle: false),
            ],
          ),
        ),
      ),
    );
  }
}
