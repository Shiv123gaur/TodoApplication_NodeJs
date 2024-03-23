import 'package:todo_reminder/Api/apiclient.dart';
import  'dart:io';
import 'package:http/http.dart' as http;
import 'package:todo_reminder/constants/api_routes.dart';


class ProfileRepo{
 final ApiClient apiClient;
 ProfileRepo({required this.apiClient});

 uploadImage(File? file)async{
      http.StreamedResponse response = await apiClient.uploadImage(file, ApiRoutes().uploadImage);
      return response;
 }

}