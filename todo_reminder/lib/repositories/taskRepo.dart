import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_reminder/Api/apiclient.dart';
import 'package:todo_reminder/constants/api_routes.dart';
import 'package:todo_reminder/models/addtaskModel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class TaskRepo{
  final ApiClient apiclient;
  TaskRepo({required this.apiclient});

  Future<http.Response> AddTask(TaskAddModel model)async{
      http.Response response = await apiclient.PostData(model.toJson(),ApiRoutes().AddTask);
      return response;
  }


  GetAllTasks()async{
     http.Response response  = await apiclient.FetchData(ApiRoutes().getTasks);
     return response;
  }

}