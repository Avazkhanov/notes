import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/data/models/task_model.dart';
import 'package:notes/screens/home/widgets/delete_dialog.dart';
import 'package:notes/screens/routes.dart';
import 'package:notes/utils/images/app_images.dart';
import 'package:notes/utils/styles/app_style.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        TaskModel task = tasks[index];
        return Dismissible(
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (context) {
                return deleteDialog(context: context, id: task.id);
              },
            );
          },
          background: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(15.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 10.h),
              child: SvgPicture.asset(
                AppImages.delete,
                fit: BoxFit.fill,
              ),
            ),
          ),
          key: Key(task.id.toString()),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: task.color,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.r),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.edit, arguments: task);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                child: Text(
                  task.title,
                  style: AppStyle.interNunitoRegular
                      .copyWith(fontSize: 25.sp, color: Colors.black),
                ),
              ),
            ),
          ),
          // onDismissed: (direction) {
          //   context.read<TasksBlock>().add(DeleteTaskEvent(id: task.id));
          // },
        );
      },
    );
  }
}
