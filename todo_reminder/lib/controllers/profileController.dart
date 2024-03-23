
import 'dart:io';
import 'package:get/get.dart';
import 'package:todo_reminder/repositories/profileRepo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController{
    final ProfileRepo profileRepo;
    ProfileController({required this.profileRepo});


    bool picked = false;
    bool _isloading = false;
    bool get loading => _isloading;
    File? _file;
    File? get filee=>_file;
   PickImage()async{
       final _picker = ImagePicker();
       final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
       if(pickedFile!=null){
         picked = true;
        _file = File(pickedFile.path);
        update();
       }else{
         picked = false;
         print("Image not picked !");
       }
    }

    Future<bool> uploadImage()async{
     if(picked){
       _isloading = true;

       update();
       http.StreamedResponse response = await profileRepo.uploadImage(_file);
       if(response.statusCode==200){
         _isloading = false;
         update();
         return true;
       }else{
         _isloading = false;
         update();
         return false;
       }
     }else{
        return false;
     }
    }
}