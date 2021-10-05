import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:werk/Screens/ChatListScreen.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  // const ChatScreen({ Key? key }) : super(key: key);
  static final String id = "ChatScreen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static final _auth = FirebaseAuth.instance;
  void getCurrentUSer() {
    try {
      final theUser = _auth.currentUser;
      if (theUser != null) {
        loggedInUser = theUser;
        print("Loggedin User = ${loggedInUser.email}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUSer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECEEFB),
      // appBar: AppBar(
      //   // centerTitle: true,
      //   backgroundColor: Color(0xffE8C7DE),
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(40))),
      //   title: Row(
      //     children: [
      //       Icon(FontAwesomeIcons.home),
      //       SizedBox(width: 20),
      //       Text(
      //         "Lobby",
      //         style:
      //             TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
      //       ),
      //     ],
      //   ),
      //   // leading: Text("ss"),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => ChatListScreen()));
      //       },
      //       icon: Icon(FontAwesomeIcons.bars),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //         _auth.signOut();
      //       },
      //       icon: Icon(FontAwesomeIcons.signOutAlt),
      //     ),
      //   ],
      // ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Color(0xff8EC957),
            // height: 200,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "IT Department",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            top: 60,
          ),
          Positioned(
            right: 10,
            top: 45,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatListScreen()));
              },
              icon: Icon(
                FontAwesomeIcons.list,
                color: Color(0xffECEEFB),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              // padding: EdgeInsets.only(bottom: 100),
              child: MessageStream(),
              height: 700,
              width: MediaQuery.of(context).size.width,
              // color: Colors.amber,
              decoration: BoxDecoration(
                  color: Color(0xffECEEFB),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 35, left: 25, right: 25),
              child: Container(
                padding: EdgeInsets.only(left: 15),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 0),
                      spreadRadius: 3,
                      blurRadius: 7,
                    )
                  ],
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                      // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      margin: EdgeInsets.fromLTRB(15, 5, 7, 5),
                      width: 250,
                      child: TextField(
                        controller: messageBoxController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          messageText = value;
                        },
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffECEEFB),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    Container(
                      width: 40,
                      child: TextButton(
                          onPressed: () {
                            messageBoxController.clear();
                            _firestore.collection('messages').add({
                              "text": messageText,
                              "sender": loggedInUser.email,
                              "timestamp":
                                  DateTime.now().toUtc().microsecondsSinceEpoch,
                            });
                          },
                          child: Icon(FontAwesomeIcons.paperPlane)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final messageBoxController = TextEditingController();
  late String messageText;
}

class MessageStream extends StatefulWidget {
  // const MessageStream({ Key? key }) : super(key: key);

  @override
  _MessageStreamState createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            _firestore.collection("messages").orderBy("timestamp").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("loading");
          }

          final messages = snapshot.data!.docs;

          List<MessageBox> xList = [];

          for (var x in messages) {
            xList.add(MessageBox(
              message: x.get("text"),
              sender: x.get("sender"),
              isMe: loggedInUser.email == x.get("sender"),
            ));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: xList,
            ),
          );
        });
  }
}

class MessageBox extends StatelessWidget {
  // const MessageBox({ Key? key }) : super(key: key);

  final String message;
  final String sender;
  final bool isMe;

  MessageBox({required this.message, required this.sender, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(message),
            ),
            decoration: BoxDecoration(
              color: isMe ? Colors.blueAccent : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
        ],
      ),
    );
  }
}
