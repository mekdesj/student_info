import 'package:flutter/material.dart';

ButtonStyle customButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.amberAccent,
    textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  );
}
