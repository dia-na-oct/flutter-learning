import 'package:chatapp/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatroomScreen extends StatefulWidget {
  String chatroomName;
  String chatroomId;
  ChatroomScreen(
      {super.key, required this.chatroomId, required this.chatroomName});

  @override
  State<ChatroomScreen> createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  var db = FirebaseFirestore.instance;
  TextEditingController messagetext = TextEditingController();
  Future<void> senmsg() async {
    if (messagetext.text.isEmpty) {
      return;
    }
    Map<String, dynamic> messagetosend = {
      "text": messagetext.text,
      "sender": Provider.of<UserProvider>(context, listen: false).useName,
      "chatroom_id": widget.chatroomId,
      "sender_id": Provider.of<UserProvider>(context, listen: false).userId,
      "timestamp": FieldValue.serverTimestamp(),
    };
    messagetext.text = "";

    try {
      await db.collection("messages").add(messagetosend);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatroomName),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("somme error has occured");
              }
              var allmsg = snapshot.data?.docs ?? [];
              return ListView.builder(
                  reverse: true,
                  itemCount: allmsg.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: allmsg[index]["sender_id"] ==
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .userId
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(allmsg[index]["text"]),
                          Text(
                            allmsg[index]["sender"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    );
                  });
            },
            stream: db
                .collection("messages")
                .where("chatroom_id", isEqualTo: widget.chatroomId)
                .orderBy("timestamp")
                .snapshots(),
          )),
          Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messagetext,
                      decoration: InputDecoration(
                          hintText: "write your message here",
                          border: InputBorder.none),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        senmsg();
                      },
                      child: Icon(Icons.send))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
