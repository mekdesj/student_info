import 'package:flutter/material.dart';
import 'package:student_info/forms/add_student.dart';

class Custom_FloatingActionButton extends StatelessWidget {
  const Custom_FloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showAddStudentForm(context);
      },
      icon: Icon(Icons.add),
      label: Text("Add Student"),
      backgroundColor: const Color.fromARGB(255, 116, 94, 241),
    );
  }
}
