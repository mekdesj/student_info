import 'package:flutter/material.dart';
import 'package:student_info/screens/custom_app_bar.dart';

class cs extends StatelessWidget {
  const cs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Computer Science Screen'),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Hello this is computer Science screen")],
        ),
      ),
    );
  }
}
