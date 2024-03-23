import 'package:todo_reminder/constants/api_routes.dart';
import 'package:todo_reminder/models/eventModel.dart';

import "../Api/apiclient.dart";
import 'package:http/http.dart' as https;

class CalenderRepo{
  final ApiClient apiClient;
  CalenderRepo({required this.apiClient});
  Future<https.Response> addEvent(Event event)async{
    https.Response response = await apiClient.PostData(event.toJson(),ApiRoutes().addEvent );
    return response;
  }

}