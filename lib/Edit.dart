import 'package:flutter/material.dart';

import 'Sqflite.dart';

class Edit extends StatefulWidget {
  final tiitle;
  final ID;
  Edit(this.tiitle , this.ID);
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  SQFLITE SQL= SQFLITE();
  var title = TextEditingController();
  @override
  void initState() {
    title.text= widget.tiitle;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextFormField(
            controller: title,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
            MaterialButton(
              onPressed: ()  async{
                  int res = await SQL.Update(
                      "UPDATE 'Todo' SET 'title' = '${title.text}' WHERE id = ${widget.ID} ");
                  if(res>0){
                      Navigator.of(context).pop();
                  }
                  print(title.text);
              },
              child: const Text("Update"),
              color: Colors.red,
            )
        ],),
      ),
    );
  }
}
