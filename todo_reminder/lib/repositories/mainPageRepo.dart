
import 'package:todo_reminder/Api/apiclient.dart';
import 'package:todo_reminder/constants/api_routes.dart';
import 'package:http/http.dart' as http;

class MainPageRepo{
  final ApiClient apiClient;
  MainPageRepo({required this.apiClient});
  
  Future<http.Response> getAlltasks()async{
    print("Repo Called");
    http.Response response = await apiClient.FetchData(ApiRoutes().getTasks);
    print("repo done");
    return response;
  }
  
}
