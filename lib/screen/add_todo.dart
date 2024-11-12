import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodo extends StatefulWidget {
  final Map? todo;
  AddTodo({super.key, this.todo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  bool flag = false;
  @override
  void initState() {
    final todo = widget.todo;

    if (todo != null) {
      flag = true;
      titleController.text = todo["title"];
      descriptionController.text = todo['description'];
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(flag ? "Edit Todo" : "Add Todo"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Title"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: descriptionController,
            keyboardType: TextInputType.multiline,
            maxLines: 8,
            minLines: 5,
            decoration: InputDecoration(hintText: "Description"),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: flag ? EditTodo : adddata,
              child: Text(flag ? "Edit ToDo" : "Submit"))
        ],
      ),
    );
  }

  void adddata() async {
    var url = "https://api.nstack.in/v1/todos";
    var title = titleController.text;
    var desc = descriptionController.text;

    final body = {"title": title, "description": desc, "is_completed": false};

    final respose =
        await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });
    print(respose.statusCode);

    if (respose.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text("Add Success")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text("Add Failed")));
    }
  }

  void EditTodo() async {
    var id = widget.todo!["_id"];
    var url = "https://api.nstack.in/v1/todos/$id";
    var title = titleController.text;
    var desc = descriptionController.text;

    final body = {"title": title, "description": desc, "is_completed": false};

    final respose =
        await http.put(Uri.parse(url), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });
    print(respose.statusCode);

    if (respose.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text("Edit Success")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text("Edit Failed")));
    }
  }
}
