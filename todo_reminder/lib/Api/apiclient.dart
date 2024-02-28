

import 'dart:convert';

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
      http.Response response = await http.post(Uri.parse(baseurl+endurl),headers: _headers,body: jsonEncode(body),);
      return response;
   }

   Future<http.Response> FetchData(String EndPoint)async{
        http.Response response  = await http.get(Uri.parse(baseurl+EndPoint),headers: _headers);
        return response;
   }
}