import 'package:flutter/material.dart';

class addtofdo extends StatefulWidget {
  void Function({required String todotext}) addToDo;

  addtofdo({super.key, required this.addToDo});
  @override
  State<addtofdo> createState() => _addtofdoState();
}

class _addtofdoState extends State<addtofdo> {
  TextEditingController todotext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("add to do"),
        TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: "write your"),
          controller: todotext,
        ),
        ElevatedButton(
            onPressed: () {
              widget.addToDo(todotext: todotext.text);
              todotext.text = "";
            },
            child: const Text("add"))
      ],
    );
  }
}
