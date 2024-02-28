

import 'package:get/get.dart';
import 'package:todo_reminder/repositories/profileRepo.dart';
import 'package:image_picker/image_picker.dart';


class ProfileController extends GetxController{
    final ProfileRepo profileRepo;
    ProfileController({required this.profileRepo});


    bool picked = false;
   PickImage()async{
       final _picker = ImagePicker();
       final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

       if(pickedFile!=null){
         picked = true;
         print(pickedFile);
         return pickedFile;
       }else{
         picked = false;
         print("Image not picked !");
       }
    }
}