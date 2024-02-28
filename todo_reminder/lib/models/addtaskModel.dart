import 'package:flutter/material.dart';

class TaskAddModel {
  String? title;
  String? description;
  bool? status;
  String? dueDate;
  DateTime? reminderTime;
  TaskAddModel(
      {required this.title,
      required this.description,
      required this.dueDate});

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = new Map<String,dynamic>();

    data["title"] = this.title;
    data["description"] = this.description;
    data["due_date"] = this.dueDate;
    data["status"] = false;
    data["reminder_time"] = DateTime.now().toString();
    return data;
  }
}
