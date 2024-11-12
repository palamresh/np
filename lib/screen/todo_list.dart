import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Stream<List<Map<String, dynamic>>> fetchToDo() async* {
    while (true) {
      final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body)['items'];
        yield List<Map<String, dynamic>>.from(json);
      } else {
        print(response.statusCode);
        throw Exception("Failed to fetch todo");
      }
      await Future.delayed(Duration(seconds: 10));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void deleteToDo(String id) async {
    final url = "https://api.nstack.in/v1/todos/$id";
    final respose = await http.delete(Uri.parse(url));

    if (respose.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text("Delete Success")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text("Delete Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddTodo()));
            },
            label: Text("Add Todo")),
        appBar: AppBar(
          elevation: 1,
          title: Text("Todo"),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: fetchToDo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error ${snapshot.hasError}"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text("NO Data Available"),
                );
              } else {
                final data = snapshot.data;
                return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      final todo = data[index];
                      return ListTile(
                        trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == "edit") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddTodo(
                                              todo: todo,
                                            )));
                              } else {
                                deleteToDo(todo['_id']);
                              }
                            },
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                    value: "edit", child: Text("edit")),
                                PopupMenuItem(
                                    value: 'delete',
                                    child: Text(
                                      "delete",
                                    ))
                              ];
                            }),
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(todo['title']),
                        subtitle: Text(todo['description']),
                      );
                    });
              }
            }));
  }
}
