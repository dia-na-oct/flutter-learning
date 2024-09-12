import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todolist.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  List<String> todolist = [];
  void addToDo({required String todotext}) {
    if (todolist.contains(todotext)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text("this data aready exists"),
              actions: [
                InkWell(
                  child: Text("close"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      return;
    }
    setState(() {
      todolist.add(todotext);
    });
    updateLocaldata();
    Navigator.pop(context);
  }

  void updateLocaldata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todolist', todolist);
  }

  void loaddata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todolist = (prefs.getStringList("todoloist") ?? []).toList();
    });
  }

  void clickeditem() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 250,
              child: addtofdo(
                addToDo: addToDo,
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.grey[900],
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  "ToDo App",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("about me"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("about me"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("hola"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              clickeditem();
            },
            splashColor: Colors.amber,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: toDoList(todolist: todolist, updateLocaldata: updateLocaldata),
    );
  }
}
