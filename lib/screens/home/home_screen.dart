import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/blocs/tasks/tasks_block.dart';
import 'package:notes/blocs/tasks/tasks_event.dart';
import 'package:notes/blocs/tasks/tasks_state.dart';
import 'package:notes/screens/globals/global_ink.dart';
import 'package:notes/screens/home/widgets/task_item.dart';
import 'package:notes/screens/routes.dart';
import 'package:notes/screens/search_tasks/search_tasks_screen.dart';
import 'package:notes/utils/colors/app_colors.dart';
import 'package:notes/utils/images/app_images.dart';
import 'package:notes/utils/styles/app_style.dart';

List<String> searchList = [];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_252525,
      appBar: AppBar(
        backgroundColor: AppColors.c_252525,
        automaticallyImplyLeading: false,
        title: Text(
          "Notes",
          style: AppStyle.interNunitoBold.copyWith(fontSize: 43.sp),
        ),
        actions: [
          BlocListener<TasksBloc, TasksState>(
            listener: (BuildContext context, state) {
              if (state is SearchTaskState) {
                searchList = [];
                for (int i = 0; i < state.allTasks.length; i++) {
                  searchList.add(state.allTasks[i].title);
                }
              }
            },
            child: GlobalInk(
              icon: Icons.search,
              onTap: () async {
                showSearch(
                  context: context,
                  delegate: TasksSearchScreen(),
                );
                context.read<TasksBloc>().add(SearchTaskEvent());
              },
            ),
          ),
          SizedBox(width: 22.w)
        ],
      ),
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state is TasksLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TasksEmptyState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.empty,
                    height: 250.h,
                  ),
                  Text(
                    "Create your first note !",
                    style:
                        AppStyle.interNunitoRegular.copyWith(fontSize: 20.sp),
                  )
                ],
              ),
            );
          }
          if (state is TasksSuccessState) {
            return TaskItem(tasks: state.tasks);
          }
          if (state is TasksErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text(
              "Error",
              style: AppStyle.interNunitoBold.copyWith(fontSize: 30.sp),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.add);
        },
        backgroundColor: AppColors.c_252525,
        shape: const CircleBorder(),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColors.c_252525,
              blurRadius: 20.w,
              spreadRadius: 0,
              offset: const Offset(0, 20),
            ),
          ]),
          child: Icon(
            Icons.add,
            size: 28.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
