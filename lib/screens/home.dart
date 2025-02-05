import 'package:flutter/material.dart';
import 'package:student_info/screens/custom_app_bar.dart';
import 'package:student_info/side_menu/nav_bar.dart';
import 'package:student_info/screens/students_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: CustomAppBar(context, "Home page"),
        body: StudentListScreen());
  }
}
