import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var output = "";
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[100],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("My Tasks: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
                itemCount: lst.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[600],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: ListTile(
                      title: Text(
                        "${lst[index]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Container(
                        width: 50,
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Icon(Icons.edit),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Edit Task"),
                                        content: TextField(
                                          onChanged: (value) {
                                            output = value;
                                          },
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.black26),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Edit"),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                            GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: () {
                                setState(() {
                                  lst.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.blueGrey[800],
              icon: Icon(Icons.clear_all),
              label: Text("Clear All"),
              onPressed: () {
                setState(() {
                  lst.clear();
                });
              },
            ),
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.blueGrey[800],
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Add Task"),
                        content: TextField(
                          onChanged: (value) {
                            output = value;
                          },
                        ),
                        actions: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.black26),
                            ),
                            onPressed: () {
                              setState(() {
                                lst.add(output);
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text("Add"),
                          )
                        ],
                      );
                    });
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
