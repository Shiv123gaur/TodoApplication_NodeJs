
import 'package:get/get.dart';
import 'package:todo_reminder/Api/apiclient.dart';

class HomepageController extends GetxController {

  int _pageNumber = 0 ;


   set SetTabno (int index) {
    _pageNumber = index;
    update();
   }
    int get Getpageno =>_pageNumber;


}