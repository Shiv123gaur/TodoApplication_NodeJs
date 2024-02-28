class GoogleSignupModel{
  String? name;
  String? email;
  String? googleId;
  String? profile;
  GoogleSignupModel({required this.name,required this.profile,required this.email,required this.googleId});
  Map<String,dynamic> toJson(){
       Map<String,dynamic> user = new Map<String,dynamic>();
       user["name"] = this.name;
       user["email"] = this.email;
       user["googleId"] = this.googleId;
       user["profile"] = this.profile;
       return user;
  }
}