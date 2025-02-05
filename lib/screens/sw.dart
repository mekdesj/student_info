import 'package:flutter/material.dart';
import 'package:student_info/screens/custom_app_bar.dart';

class sw extends StatelessWidget {
  const sw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(context, 'Software Engineering Screen'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Hello this is Software Engineering screen")],
          ),
        ));
  }
}
