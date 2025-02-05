import 'package:flutter/material.dart';
import 'package:student_info/screens/button.dart';
// import 'package:student_info/screens/button_decore.dart';
import 'package:student_info/database/database_helper.dart';
import 'package:student_info/database/student_model.dart';

void showAddStudentForm(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedDepartment;
  String resultText = '';
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Add New Student'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DropdownButtonFormField<String>(
                      decoration:
                          InputDecoration(labelText: 'Select Department'),
                      items: [
                        DropdownMenuItem(
                            value: 'Computer Science',
                            child: Text('Computer Science')),
                        DropdownMenuItem(
                            value: 'Information Technology',
                            child: Text('Information Technology')),
                        DropdownMenuItem(
                            value: 'Software Engineering',
                            child: Text('Software Engineering')),
                      ],
                      onChanged: (value) {
                        selectedDepartment = value;
                      },
                      validator: (value) =>
                          value == null ? 'Please select a department' : null,
                    ),
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter first name' : null,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter last name' : null,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter email' : null,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(labelText: 'Phone'),
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter phone number' : null,
                    ),
                    SizedBox(height: 20),
                    Text(
                      resultText,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: customButtonStyle(),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  firstNameController.clear();
                  lastNameController.clear();
                  emailController.clear();
                  phoneController.clear();
                  setState(() {
                    resultText = '';
                  });
                },
                style: customButtonStyle(),
                child: Text('Clear'),
              ),
              TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // Access the controller values here
                    Student student = Student(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      department: selectedDepartment!,
                    );
                    try {
                      await DatabaseHelper.instance
                          .insertStudent(student.toMap());
                      setState(() {
                        resultText = 'Student added successfully!';
                      });
                    } catch (e) {
                      setState(() {
                        resultText = 'Failed to add student.';
                      });
                    }
                  }
                },
                style: customButtonStyle(),
                child: Text('Add'),
              ),
            ],
          );
        },
      );
    },
  );
}
