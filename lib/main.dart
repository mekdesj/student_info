import 'package:flutter/material.dart';
import 'package:student_info/screens/home.dart';
import 'package:student_info/screens/cs.dart';
import 'package:student_info/screens/it.dart';
import 'package:student_info/screens/sw.dart';
import 'package:student_info/side_menu/floating_action_button.dart';

void main() async {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: student()));
}

class student extends StatefulWidget {
  const student({super.key});
  @override
  State<student> createState() => _BottomNavState();
}

class _BottomNavState extends State<student> {
  int index = 0;
  final pages = [Home(), cs(), it(), sw()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[index],
        floatingActionButton: Custom_FloatingActionButton(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          backgroundColor: const Color.fromARGB(255, 150, 140, 0),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.tealAccent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 15,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            print('${pages[value]} bottom navigation pressed');
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.computer), label: "CS"),
            BottomNavigationBarItem(icon: Icon(Icons.memory), label: "IT"),
            BottomNavigationBarItem(icon: Icon(Icons.code), label: "SE")
          ],
        ));
  }
}
