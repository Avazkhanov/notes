import 'package:flutter/material.dart';

class TaskModel {
  final int id;
  final String title;
  final String description;
  final Color color;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      color: Color(int.parse('0xff' + json["color"])),
    );
  }

  Map<String, dynamic> toJson() {
    var temp = color.toString().substring(10,16);
    debugPrint(temp);
    return {
      'title': title,
      'description': description,
      'color': temp,
    };
  }

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    Color? color,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
    );
  }
}
