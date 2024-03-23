import 'package:intl/intl.dart';
import 'package:todo_reminder/models/eventModel.dart';
import 'package:get/get.dart';
import '../repositories/calenderRepo.dart';
import 'package:http/http.dart' as https;

class CalenderController extends GetxController {
  final CalenderRepo calenderRepo;
  CalenderController({required this.calenderRepo});
  DateTime _selectedDate = DateTime.now();
  DateTime _focustedDate = DateTime.now();

  List<Event> _currentDayEvents = [];
  List<Event> get currentDayevents => _currentDayEvents;
  set currentDayevents(List<Event> events) {
    _currentDayEvents.clear();
    _currentDayEvents.addAll(events);
    update();
  }

  set selectedDate(DateTime date) {
    _selectedDate = date;
    update();
  }

  set focusedDate(DateTime date) {
    _focustedDate = date;
    update();
  }

  DateTime get focusedDate => _focustedDate;
  DateTime get selectedDate => _selectedDate;

  Map<DateTime, List<Event>> Events = {};
  Map<DateTime, List<Event>> get eventss => Events;

  void AddEvent(String title, String description, DateTime date) async{
         Event newEvent = Event(title: title, description: description, date: date.toString());
         https.Response response = await calenderRepo.addEvent(newEvent);
         print(response.body);
  }

  GetEvents(DateTime date) {
    currentDayevents.clear();
    update();
    if (Events.containsKey(date)) {
      currentDayevents = Events[date] ?? [];
    }
  }
}
