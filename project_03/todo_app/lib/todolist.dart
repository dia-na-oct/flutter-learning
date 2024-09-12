import 'package:flutter/material.dart';

class toDoList extends StatefulWidget {
  List<String> todolist;
  toDoList({super.key, required this.todolist, required this.updateLocaldata});
  void Function() updateLocaldata;
  @override
  State<toDoList> createState() => _toDoListState();
}

class _toDoListState extends State<toDoList> {
  void onitemclicked({
    required int index,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all((20)),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.todolist.removeAt(index);
                  });
                  widget.updateLocaldata();

                  Navigator.pop(context);
                },
                child: Text("Mark as done!")),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todolist.isEmpty)
        ? Center(child: Text("no data"))
        : ListView.builder(
            itemCount: widget.todolist.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  onitemclicked(index: index);
                },
                title: Text(widget.todolist[index]),
              );
            });
  }
}
