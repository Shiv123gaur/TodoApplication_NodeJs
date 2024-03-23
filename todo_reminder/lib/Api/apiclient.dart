

import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect implements GetxService{
   late String token;
   late String baseurl;
   Map<String,String> _headers={};
   ApiClient({required baseUrl,required token}){
         baseurl = baseUrl;
         _headers = {
            'Content-type':'application/json',
            'Authorization':"Bearer ${token}",
            'timeout':'15'
         };
   }

   updateHeaders(String tokenn){
      _headers = {
        'Content-type':'application/json',
        'Authorization':"Bearer ${tokenn}",
        'timeout':'15'
      };
   }
   Future<http.Response> PostData(Map<String,dynamic> body,endurl)async{
     print(baseurl+endurl);
      http.Response response = await http.post(Uri.parse(baseurl+endurl),headers: _headers,body: jsonEncode(body),);
      return response;
   }
    uploadImage(File? file,String endurl)async{
     final uri = Uri.parse(baseurl+endurl);
     final request = http.MultipartRequest('POST',uri)..files.add(await http.MultipartFile.fromPath("image",file!.path));
     request.headers.addAll(_headers);
     try{
       final response = await request.send();
       print(response.toString());
        return response;
     }catch(e){
       print("There was an erro while uploading the image");
     }
   }


   Future<http.Response> FetchData(String EndPoint)async{
        http.Response response  = await http.get(Uri.parse(baseurl+EndPoint),headers: _headers);
        return response;
   }
}