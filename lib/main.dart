// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:todo_app/Home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LT(),
    );
  }
}