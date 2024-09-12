import 'package:bucketlist/addBucketList.dart';
import 'package:bucketlist/viewitem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<dynamic> bucketlist = [];
  bool isloading = false;
  bool iserror = false;
  Future<void> getData() async {
    setState(() {
      isloading = true;
    });
    try {
      Response response = await Dio().get(
          "https://bucketlist-98088-default-rtdb.firebaseio.com/bucket.json");
      if (response.data is List) {
        bucketlist = response.data;
      } else {
        bucketlist = [];
      }
      isloading = false;
      iserror = false;
      setState(() {});
    } catch (e) {
      isloading = false;
      iserror = true;

      setState(() {});
    }
  }

  Widget errorwifget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning),
          Text("error getting data"),
          ElevatedButton(onPressed: getData, child: Text("tryagain"))
        ],
      ),
    );
  }

  Widget listdata() {
    List<dynamic> filter = bucketlist
        .where((element) => (!element["completed"] ?? false))
        .toList();
    return filter.length < 1
        ? Center(child: Text("no data"))
        : ListView.builder(
            itemCount: bucketlist.length,
            itemBuilder: (BuildContext context, int index) {
              return (bucketlist[index] is Map &&
                      (!bucketlist[index]["completed"]))
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ViewItemScreen(
                              title: bucketlist[index]['item'],
                              image: bucketlist[index]['image'],
                              index: index,
                            );
                          })).then((value) {
                            if (value == "refresh") {
                              getData();
                            }
                          });
                        },
                        title: Text(bucketlist[index]?["item"]),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(bucketlist[index]?['image'] ?? ""),
                        ),
                        trailing:
                            Text(bucketlist[index]?['cost'].toString() ?? ""),
                      ),
                    )
                  : SizedBox();
            });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddBucketListScreen(newindex: bucketlist.length);
          })).then((value) {
            if (value == "refresh") {
              getData();
            }
          });
        },
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
      appBar: AppBar(
        title: Text("Bucket List"),
        actions: [
          InkWell(
              onTap: getData,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.refresh),
              ))
        ],
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            getData();
          },
          child: isloading
              ? LinearProgressIndicator()
              : iserror
                  ? errorwifget()
                  : listdata()),
    );
  }
}
