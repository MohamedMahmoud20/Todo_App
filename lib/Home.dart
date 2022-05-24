// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:todo_app/Edit.dart';

import 'Sqflite.dart';
import 'description.dart';

class LT extends StatefulWidget {
  @override
  State<LT> createState() => _LTState();
}

class _LTState extends State<LT> {
  SQFLITE SQL = SQFLITE();
  List  Notes = [];

  readdata() async {
    print("hfgh");
    var rsponse = await SQL.Select("SELECT * FROM 'Todo'");
    if (this.mounted) {
      setState(() {});
    }
    Notes.addAll(rsponse);
    return rsponse;
  }

  @override
  void initState() {
    readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Note"),
      ),
      body: ListView.builder(
        itemCount: Notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, right: 5.0, left: 5.0, bottom: 10.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  title: Text("${Notes[index]['title']}"),
                  subtitle: Text("${Notes[index]['id']}"),
                  trailing: IconButton(
                    onPressed: () async {
                      int res = await SQL.Delete(
                          "DELETE FROM 'Todo' WHERE id = ${Notes[index]['id']}");
                      if (res > 0) {
                        Notes.removeWhere(
                            (element) => element["id"] == Notes[index]["id"]);
                        setState(() {});
                        print("Done");
                      }
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                  leading: IconButton(
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Edit(Notes[index]['title'] ,Notes[index]['id'] );
                      }));
                      print(Notes[index]['title']);
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Des();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
