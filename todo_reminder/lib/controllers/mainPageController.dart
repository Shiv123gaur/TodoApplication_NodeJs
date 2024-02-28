import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_reminder/models/Task.dart';
import 'package:http/http.dart' as http;
import 'package:todo_reminder/models/userProfile.dart';

import '../repositories/mainPageRepo.dart';

class MainPageController extends GetxController{
  final MainPageRepo mainPageRepo;
  MainPageController({required this.mainPageRepo});

  int _currentPage = 0;
  set currentpage(int index){

    _currentPage = index;
    update();
  }
  int get currentpage =>_currentPage;

  bool _isloading = false;
   bool get isloading => _isloading;
}