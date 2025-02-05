import 'package:flutter/material.dart';
import 'package:student_info/screens/custom_app_bar.dart';

class it extends StatelessWidget {
  const it({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Information Technology Screen'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Hello this is Information Technology screen")],
        ),
      ),
    );
  }
}
