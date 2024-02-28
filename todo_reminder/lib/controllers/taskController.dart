import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_reminder/controllers/mainPageController.dart';
import 'package:todo_reminder/models/Task.dart';
import 'package:todo_reminder/repositories/taskRepo.dart';
import 'package:todo_reminder/models/addtaskModel.dart';

import '../models/userProfile.dart';

class TaskController extends GetxController{
  final TaskRepo taskRep;
  TaskController({required this.taskRep});


  List<Task> get getallTasks =>_UserTasks;
  bool _loading = false;
  bool get isloading => _loading;

  TimeOfDay _currentTime  = TimeOfDay.now();
  TimeOfDay get getcurrentTime => _currentTime;

  set setcurrentTime (currentTime){
     _currentTime = currentTime;
     update();
  }
  List<Task> _UserTasks = [];
  List<Task> get Tasks =>_UserTasks;

  List<Task> _CompletedTasks = [];
  List<Task> get completedTasks => _CompletedTasks;

  List <Task> _PendingTasks = [];
  List<Task> get pendingTasks => _PendingTasks;

  late User _user;
  User get user =>_user;

  SeperateTasks(List<Task> tasks){
    tasks.forEach((task) {
      if(task.status == false){
        _PendingTasks.add(task);
      }else{
        _CompletedTasks.add(task);
      }
    });
    update();
  }
  DateTime _selectedDateTime = DateTime.now();
  DateTime get selectedDateTime => _selectedDateTime;
  set selectedDatetime(date) {
    _selectedDateTime = date;
    update();
  }

  AddTask(String taskTitle,String taskDescription,DateTime taskdue)async{
        _loading = true;
        update();
        TaskAddModel model = TaskAddModel(title: taskTitle, description: taskDescription, dueDate: taskdue.toString());
        http.Response response = await taskRep.AddTask(model);
        if(response.statusCode==200){
               await GetAllTasks();
        }else{

        }
        _loading = false;
        update();
  }

  GetAllTasks()async{
      _loading = true;
       http.Response response = await taskRep.GetAllTasks();
       if(response.statusCode==200){
         _loading = false;
         List data = jsonDecode(response.body);
         if(data.length!=0){
           _UserTasks = [];
           update();
           data.forEach((element) {
              _UserTasks.add(Task.fromJson(element));
           });
           _CompletedTasks = [];
           _PendingTasks = [];
           SeperateTasks(_UserTasks);
           update();
         }
       }
  }

}