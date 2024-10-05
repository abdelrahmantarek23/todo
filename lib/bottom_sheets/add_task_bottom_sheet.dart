import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/app_colors.dart';
import 'package:to_do/firebase_functions.dart';
import 'package:to_do/models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text("Title"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            SizedBox(height: 18),
            TextFormField(
              controller: subTitleController,
              decoration: InputDecoration(
                label: Text("Description"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            SizedBox(height: 18),
            Text(
              "Select Time",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 18),
            InkWell(
              onTap: selectDateFunction,
              child: Text(
                DateFormat('yyyy-MM-dd').format(selectedDate),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isEmpty || subTitleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields')),
                  );
                  return;
                }

                TaskModel task = TaskModel(
                  title: titleController.text,
                  subTitle: subTitleController.text,
                  date: selectedDate.millisecondsSinceEpoch,
                );
                await FirebaseFunctions().addTask(task);
                Navigator.of(context).pop(); // Close the bottom sheet
              },
              child: Text(
                "Add Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  selectDateFunction() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      setState(() {
        selectedDate = chosenDate;
      });
    }
  }
}
