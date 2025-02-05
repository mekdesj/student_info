import 'package:flutter/material.dart';
import 'package:student_info/database/database_helper.dart';
import 'package:student_info/database/student_model.dart';
import 'package:student_info/side_menu/floating_action_button.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  late Future<List<Student>> studentList;
  @override
  void initState() {
    super.initState();
    studentList = DatabaseHelper.instance.getStudentList(); //Fetch all students
  }

  Future<void> _refreshStudentList() async {
    setState(() {
      studentList =
          DatabaseHelper.instance.getStudentList(); //Fetch all students
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Students')),
      body: FutureBuilder<List<Student>>(
        future: studentList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No students found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Student student = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Department: ${student.department}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('First Name: ${student.firstName}',
                            style: TextStyle(fontSize: 14)),
                        Text('Last Name: ${student.lastName}',
                            style: TextStyle(fontSize: 14)),
                        Text('Email: ${student.email}',
                            style: TextStyle(fontSize: 14)),
                        Text('Phone: ${student.phone}',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: Custom_FloatingActionButton(), //to add new student
    );
  }
}
