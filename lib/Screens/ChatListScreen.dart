import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:werk/Screens/ChatScreen.dart';
import 'package:werk/Screens/PersonalChatCreen.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class ChatListScreen extends StatefulWidget {
  // const ChatListScreen({ Key? key }) : super(key: key);
  static final String id = "ChatListScreen";

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  static final _auth = FirebaseAuth.instance;
  late User loggedInUser;

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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 200,
            color: Colors.amber,
            child: Center(
                child: Text(
              "Chat List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w900),
            )),
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(top: 170),
            child: Container(
              height: 800,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: ChatListStream(),
            ),
          ),
          Positioned(
            top: 140,
            right: 7,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalChatScreen(
                              user1: "${loggedInUser.email}",
                            )));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatListStream extends StatefulWidget {
  // const ChatListStream({ Key? key }) : super(key: key);

  @override
  _ChatListStreamState createState() => _ChatListStreamState();
}

class _ChatListStreamState extends State<ChatListStream> {
  final loggedInUser = _auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection("UI")
          .doc("chat_list")
          .collection("${loggedInUser!.email}")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator.adaptive();
        }

        final myChatList = snapshot.data!.docs;

        List<Text> xList = [];

        List<ChatListCard> ChatList = [];

        for (var x in myChatList) {
          ChatList.add(ChatListCard(
            name: x.get("name"),
            email: x.get("email"),
            thePushTo: x.get("email"),
          ));
        }

        for (var x in myChatList) {
          xList.add(
              Text("name : ${x.get("name")}     email : ${x.get("email")}"));
        }

        return ListView(
          children: ChatList,
        );
      },
    );
  }
}

class ChatListCard extends StatelessWidget {
  // const ChatListCard({Key? key}) : super(key: key);

  final String name;
  final String email;
  final String thePushTo;

  ChatListCard(
      {required this.name, required this.email, required this.thePushTo});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Image(
              image: AssetImage("lib/img/cat-pp.png"),
              height: 70,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                Text(email),
              ],
            ),
          ],
        ),
      ),
      onPressed: () {
        // Navigator.pushNamed(context, thePushTo);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PersonalChatScreen(
                      user1: thePushTo,
                    )));
      },
    );
  }
}
