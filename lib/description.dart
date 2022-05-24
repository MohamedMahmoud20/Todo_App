// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:todo_app/Home.dart';
import 'Sqflite.dart';

class Des extends StatefulWidget {
  @override
  State<Des> createState() => _DesState();
}

class _DesState extends State<Des> {
  SQFLITE SQL = SQFLITE();

  GlobalKey Formstate = GlobalKey();

  var title = TextEditingController();
  var color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: Formstate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () async {
                  int res = await SQL.Insert('''INSERT INTO Todo ('title')
              VALUES("${title.text}")
              ''');
                  if (res > 0) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return LT();
                    }), (route) => false);
                  }
                  print(res);
                },
                child: Text("Add"),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
