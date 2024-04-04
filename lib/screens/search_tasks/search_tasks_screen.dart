import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/blocs/tasks/tasks_block.dart';
import 'package:notes/blocs/tasks/tasks_event.dart';
import 'package:notes/screens/home/home_screen.dart';
import 'package:notes/utils/colors/app_colors.dart';

class TasksSearchScreen extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
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
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.c_252525,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              suggestionList[index],
              style: TextStyle(color: Colors.white,fontSize: 18),
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