class Userr{
  String? name;
  String? email;
  String? profile;
  Userr({required this.email,required this.name,required this.profile});

  Userr.fromJson(Map<String,dynamic> data){
    name = data["name"];
    email = data["email"];
    profile = data["profile_photo"]!=null?data["profile_photo"]:"E:/Flutter_Projects/todo_reminder/assets/images/Checkmark.png";
  }
}