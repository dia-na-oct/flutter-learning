import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ViewItemScreen extends StatefulWidget {
  String title;
  String image;
  int index;
  ViewItemScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.index});

  @override
  State<ViewItemScreen> createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
 

  void deletedata() async {
    try {
      Navigator.pop(context);
      Response response = await Dio().delete(
          "https://bucketlist-98088-default-rtdb.firebaseio.com/bucket/${widget.index}.json");
      Navigator.pop(context, "refresh");
    } catch (e) {}
  }

  void markascomplete() async {
    Map<String, dynamic> data = {"completed": true};
    try {
      Response response = await Dio().patch(
          "https://bucketlist-98088-default-rtdb.firebaseio.com/bucket/${widget.index}.json",
          data: data);
      Navigator.pop(context, "refresh");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(onSelected: (value) {
            if (value == 1) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("are you sure to delete"),
                      actions: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text("annuler")),
                        InkWell(onTap: deletedata, child: Text("confirmer"))
                      ],
                    );
                  });
            }
            if (value == 2) {
              markascomplete();
            }
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(value: 1, child: Text("delete")),
              PopupMenuItem(value: 2, child: Text("mark as done"))
            ];
          })
        ],
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.image))),
          ),
        ],
      ),
    );
  }
}
