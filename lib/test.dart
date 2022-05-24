// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import 'Sqflite.dart';
import 'description.dart';
class Le extends StatelessWidget {
  const Le({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String VE = "4547";
    SQFLITE SQL= SQFLITE();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () async{
                await SQL.Deletell();
              }, icon: const Icon(Icons.delete)),
              IconButton(splashColor: Colors.amberAccent,

                onPressed: () async {
                  int res = await SQL.Insert(
                      "INSERT INTO 'Todo'('title') VALUES ('$VE') ");
                  print(res);
                },
                icon: Icon(Icons.insert_chart),
              ),
              IconButton(
                onPressed: () async {
                  List<Map> res = await SQL.Select("SELECT * FROM 'Todo'");
                  print("$res");
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () async {
                  int res = await SQL.Delete("DELETE FROM 'Todo' WHERE id");
                  print("$res");
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () async {
                  int res = await SQL.Update("UPDATE 'Todo' SET 'title' = 'Tw1ns' WHERE id ");
                  print("$res");
                },
                icon: Icon(Icons.circle),
              ),
              Text(VE)
            ],
          )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
          return Des();
        }));
      },),
    );
  }
}