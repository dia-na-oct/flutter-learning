import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddBucketListScreen extends StatefulWidget {
  int newindex;
  AddBucketListScreen({super.key, required this.newindex});

  @override
  State<AddBucketListScreen> createState() => _AddBucketListScreenState();
}

class _AddBucketListScreenState extends State<AddBucketListScreen> {
  TextEditingController item = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController cost = TextEditingController();
  void adddata() async {
    Map<String, dynamic> data = {
      "item": item.text,
      "cost": cost.text,
      "image": image.text,
      "completed": false
    };
    try {
      Response response = await Dio().patch(
          "https://bucketlist-98088-default-rtdb.firebaseio.com/bucket/${widget.newindex}.json",
          data: data);
      Navigator.pop(context, "refresh");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hola"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: item,
              decoration: InputDecoration(label: Text("item")),
            ),
            TextField(
              controller: cost,
              decoration: InputDecoration(label: Text("const")),
            ),
            TextField(
              controller: image,
              decoration: InputDecoration(label: Text("image")),
            ),
            Center(
                child:
                    ElevatedButton(onPressed: adddata, child: Text("add item")))
          ],
        ),
      ),
    );
  }
}
