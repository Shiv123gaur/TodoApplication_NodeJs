import 'dart:ffi';

class Task{
  String? title;
  String? description;
  bool? status;
  DateTime? due_date;
  DateTime? reminder_time;
  Task({required this.title,required this.description,required this.status,required this.due_date,required this.reminder_time});

  Task.fromJson(Map<String,dynamic> json){
      title = json["title"];
      description = json["description"];
      status = json["status"];
      due_date = DateTime.parse(json["due_date"]);
      reminder_time = DateTime.parse(json["reminder_time"]);
  }
}