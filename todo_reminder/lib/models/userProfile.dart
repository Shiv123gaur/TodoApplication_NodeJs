class User{
  String? name;
  String? email;
  String? profile;
  User({required this.email,required this.name,required this.profile});

  User.fromJson(Map<String,dynamic> data){
    name = data["name"];
    email = data["email"];
    profile = data["profile_photo"]!=null?data["profile_photo"]:"E:/Flutter_Projects/todo_reminder/assets/images/Checkmark.png";
  }
}