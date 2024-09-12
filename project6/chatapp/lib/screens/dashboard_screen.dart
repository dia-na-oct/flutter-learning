import 'package:chatapp/providers/user_provider.dart';
import 'package:chatapp/screens/chatroom_screen.dart';
import 'package:chatapp/screens/profile_screen.dart';
import 'package:chatapp/screens/splash_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;
  List<Map<String, dynamic>> chatroomlist = [];
  List<String> chatroomids = [];

  void getchatrooms() async {
    await db.collection("chatroom").get().then((dataSnapshots) {
      for (var data in dataSnapshots.docs) {
        chatroomlist.add(data.data());
        chatroomids.add(data.id.toString());
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    getchatrooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user_provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Global Chat"),
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text(
                  user_provider.useName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(user_provider.userEmail),
                leading: CircleAvatar(
                  child: Text(user_provider.useName.isNotEmpty
                      ? user_provider.useName[0]
                      : 'U'),
                ),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
              ),
              ListTile(
                title: Text("logout"),
                leading: Icon(Icons.logout),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return SplashScreen();
                  }), (route) {
                    return false;
                  });
                },
              ),
              ListTile(
                title: Text("profile"),
                leading: Icon(Icons.people),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: chatroomlist.length,
          itemBuilder: (BuildContext context, int index) {
            String chatname = chatroomlist[index]["name_chat"];
            return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatroomScreen(
                    chatroomName: chatroomlist[index]["name_chat"],
                    chatroomId: chatroomids[index],
                  );
                }));
              },
              title: Text(chatroomlist[index]["name_chat"]),
              subtitle: Text(chatroomlist[index]["desc"]),
              leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey[900],
                  child: Text(
                    chatname[0],
                    style: TextStyle(color: Colors.white),
                  )),
            );
          }),
    );
  }
}
