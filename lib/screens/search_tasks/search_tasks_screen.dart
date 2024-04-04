import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/blocs/tasks/tasks_block.dart';
import 'package:notes/blocs/tasks/tasks_event.dart';
import 'package:notes/screens/home/home_screen.dart';
import 'package:notes/utils/colors/app_colors.dart';
import 'package:notes/utils/styles/app_style.dart';

class TasksSearchScreen extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.c_252525,
      appBarTheme: const AppBarTheme(
        color: AppColors.c_252525, // affects AppBar's background color

      ),
      textTheme:  TextTheme(
        titleLarge: AppStyle.interNunitoBold.copyWith(fontSize: 16.sp)
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppStyle.interNunitoBold.copyWith(fontSize: 16.sp),

      ),
    );
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear,size: 24.sp,color: Colors.white),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon:  Icon(
        Icons.arrow_back_ios_new,
        size: 24.sp,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, '');
        context.read<TasksBloc>().add(GetTasksEvent());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults = searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.c_3B3B3B,
                borderRadius: BorderRadius.circular(15.r)),
            child: Text(
              suggestionList[index],
              style: AppStyle.interNunitoBold.copyWith(fontSize: 18.sp)
            ),
          ),
          onTap: () {
            query = suggestionList[index];
            // Show the search results based on the selected suggestion.
            showResults(context);
          },
        );
      },
    );
  }
}