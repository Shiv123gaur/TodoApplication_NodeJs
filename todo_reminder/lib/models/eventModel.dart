class Event{
  String? title;
  String? description;
  String? date;

  @override
  String toString() {
    return 'Event: $title, Description $description';
  }
  Event({required this.title,required this.description,required this.date});



  Map<String,dynamic> toJson(){
    Map<String,dynamic> event = new  Map<String,dynamic>();

        event['title'] = this.title;
        event['description'] = this.description;
        event['date'] = this.date;
        return event;
  }
}