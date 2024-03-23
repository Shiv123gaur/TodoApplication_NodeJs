import 'package:todo_reminder/Api/apiclient.dart';
import 'package:todo_reminder/constants/api_routes.dart';
import 'package:todo_reminder/models/googleSignupModel.dart';
import 'package:todo_reminder/models/signupModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_reminder/models/userProfile.dart';

import '../models/signinModel.dart';

class AuthRepo {
  final ApiClient apiclient;
  final SharedPreferences preferences;
  AuthRepo({required this.apiclient, required this.preferences});

  Future<http.Response> RegisterUser(SignUpModel bodyy) async {
    http.Response response =
        await apiclient.PostData(bodyy.tojson(), ApiRoutes().registerUser);
    return response;
  }

  Future<http.Response> SignInUser(SignInModel bodyy) async {
    http.Response response =
        await apiclient.PostData(bodyy.tojson(), ApiRoutes().signinUser);
    return response;
  }

  Future<http.Response> googleSignin(String googleId) async {
    Map<String, dynamic> body = {"googleId": googleId};
    http.Response response =
        await apiclient.PostData(body, ApiRoutes().GoogleSignin);
    return response;
  }

  Future<http.Response> googleRegister(GoogleSignupModel model) async {
    http.Response response =
        await apiclient.PostData(model.toJson(), ApiRoutes().GoogleRegister);
    return response;
  }

  SaveUserToken(String token) async {
    await preferences.setString("token", token);
    await apiclient.updateHeaders(preferences.getString("token")!);
    print("token saved successfully" + token);
  }

  DeleteUserToken() async {
    await preferences.setString("token", "");
    await preferences.setBool("isloggedin", false);
    await preferences.remove("name");
    await preferences.remove("email");
    await preferences.remove("profile-photo");
  }

  Loggedin() async {
    await preferences.setBool("isloggedin", true);
  }

  SaveUserDetails(String name,String email,String profile_photo)async{
    await preferences.setString("name",name );
    await preferences.setString("email", email);
    await preferences.setString("profile-photo", profile_photo);
}

}
