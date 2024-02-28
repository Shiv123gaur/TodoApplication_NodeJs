import 'package:get/get.dart';
import 'package:todo_reminder/Api/apiclient.dart';
import 'package:todo_reminder/controllers/AuthController.dart';
import 'package:todo_reminder/controllers/mainPageController.dart';
import 'package:todo_reminder/controllers/profileController.dart';
import 'package:todo_reminder/controllers/taskController.dart';
import 'package:todo_reminder/repositories/authRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_reminder/repositories/mainPageRepo.dart';
import 'package:todo_reminder/repositories/profileRepo.dart';
import 'package:todo_reminder/repositories/taskRepo.dart';
import '../controllers/homePageController.dart';


//192.168.107.249:3000
  Future<void>  init() async{
        const baseurll = "http://10.0.2.2:3000/";
        final preferences = await SharedPreferences.getInstance();
        Get.lazyPut(()=>preferences,fenix: true);
        //Api
        String? token = Get.find<SharedPreferences>().getString("token");
        Get.lazyPut(() => ApiClient(baseUrl: baseurll,token: token));
        Get.lazyPut(()=>ProfileRepo(apiClient: Get.find()));
        //Repositories
        Get.lazyPut(()=>AuthRepo(apiclient: Get.find(),preferences: Get.find()),fenix: true);
        Get.lazyPut(()=>MainPageRepo(apiClient: Get.find()),fenix: true);
        Get.lazyPut(()=>TaskRepo(apiclient: Get.find()),fenix: true);
        //Controllers
        Get.lazyPut(()=>AuthController(authRepo: Get.find()),fenix: true);
        Get.lazyPut(()=>MainPageController(mainPageRepo: Get.find()),fenix: true);
        Get.lazyPut(() => TaskController(taskRep: Get.find()),fenix: true);
        Get.lazyPut(() => ProfileController(profileRepo: Get.find()),fenix: true);

  }
