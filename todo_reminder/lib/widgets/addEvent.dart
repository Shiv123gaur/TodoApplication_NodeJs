import 'package:flutter/material.dart';
import 'package:todo_reminder/constants/colors.dart';
import 'package:get/get.dart';
import 'package:todo_reminder/controllers/calenderController.dart';

class showAddEventDialog extends StatefulWidget {
  showAddEventDialog({super.key,required this.selectedDate});
  final DateTime selectedDate;

  @override
  State<showAddEventDialog> createState() => _showAddEventDialogState();
}

class _showAddEventDialogState extends State<showAddEventDialog> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors().mainColor,
    body: AlertDialog(
      title: Text("Add Event"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description (optional)'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
              Get.find<CalenderController>().AddEvent(titleController.text, descriptionController.text,widget.selectedDate );
              Get.back();
          },
          child: Text('Add'),
        ),
      ],
    ),);
  }
}
