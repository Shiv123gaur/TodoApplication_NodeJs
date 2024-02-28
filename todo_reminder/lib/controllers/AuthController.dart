import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:todo_reminder/models/googleSignupModel.dart';
import 'package:todo_reminder/models/signinModel.dart';
import 'package:todo_reminder/models/signupModel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_reminder/models/userProfile.dart';
import 'package:todo_reminder/screens/authPages/signIn.dart';
import '../repositories/authRepo.dart';
import 'mainPageController.dart';

class AuthController extends GetxController{
  final AuthRepo authRepo;
   AuthController({required this.authRepo});


   GoogleSignIn _googleSignin = GoogleSignIn(
      clientId: "21451957506-jjla70hve6snim303qvmm8f836t2rjrk.apps.googleusercontent.com",
      scopes: ["profile","email"]
  );

   bool _userLoggedIn = false;
   String _message = "";
   bool get userloggedIn => _userLoggedIn;
   String get message => _message;
   User _user = User(email: "",name: "",profile: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png");


   User get user => _user;
  Future<bool> RegisterUser(String email,String password,String name)async{
    SignUpModel signupbody = SignUpModel(name: name, email: email, password: password);
       http.Response response = await authRepo.RegisterUser(signupbody);
       if(response.statusCode==200){
         _userLoggedIn = true;
         var decodedbody = jsonDecode(response.body);
         authRepo.SaveUserToken(decodedbody["token"]);
         _user = User.fromJson(decodedbody["user"]);
         await authRepo.SaveUserDetails(_user.name!, _user.email!, _user.profile!);
         await authRepo.Loggedin();
         return true;
       }else if(response.statusCode==400){
           _message = "Invalid Input";
           return false;
       }else if(response.statusCode==409){
          _message = "User with this email already exists";
          return false;
       }else{
          _message = "Some thing went wrong";
          print("something went wrong");
          return false;
       }
  }



  Future<bool> LoginUser(String email,String password)async{
    print("Came here");
       SignInModel signinbody = SignInModel(email: email, password: password);
       http.Response response = await authRepo.SignInUser(signinbody);
       if(response.statusCode==200){
         _userLoggedIn = true;
         var decodedbody = jsonDecode(response.body);
         await authRepo.SaveUserToken(decodedbody["token"]);
         _user = User.fromJson(decodedbody["user"]);
         await authRepo.SaveUserDetails(_user.name!, _user.email!, _user.profile!);
         await authRepo.Loggedin();
         return true;
       }else if(response.statusCode==400){
         _message = "Invalid Input";
         update();
         return false;
       }else if(response.statusCode==409){
         _message = "User do not exist";
         update();
         return false;
       }else if(response.statusCode==401){
         _message = "invalid password";
         update();
         return false;
       }else{
         _message = "Some thing went wrong";
         update();
         return false;
       }
  }

  google_signin()async{

     GoogleSignInAccount? account = await _googleSignin.signIn();
      if(account==null){
           print("Signin Failed !!!!");
           //_message = "Signin faild";
           return false;
      }else {
             http.Response response = await authRepo.googleSignin(account.id);
             if(response.statusCode==200){
               var body = jsonDecode(response.body);
               String token = body["token"];
               _user = User.fromJson(body["user"]);
               update();
               await authRepo.SaveUserToken(token);
               await authRepo.SaveUserDetails(_user.name!, _user.email!, _user.profile!);
               await authRepo.Loggedin();
               return true;
             }else{
               var body = jsonDecode(response.body);
               _message = body["msg"];
               update();
                return false;
             }

      }
  }

  google_signup()async{
      GoogleSignInAccount? account = await _googleSignin.signIn();
      if(account==null){
         print("Failed signin");
      }else{
        GoogleSignupModel model = GoogleSignupModel(name: account.displayName, profile: account.photoUrl, email: account.email, googleId: account.id);
         http.Response response = await authRepo.googleRegister(model);
         if(response.statusCode==200){
           var body = jsonDecode(response.body);
           _user = User.fromJson(body["user"]);
           await authRepo.SaveUserDetails(_user.name!, _user.email!, _user.profile!);
           update();
           return true;
         }else if(response.statusCode==400){
           var body = jsonDecode(response.body);
           _message = body["msg"];
           update();
           return false;
         }
      }
  }

  Logout()async{
     await authRepo.DeleteUserToken();
     await _googleSignin.signOut();
     Get.find<MainPageController>().dispose();

     Get.offAll(SignInPage());
  }




}