import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:werk/Items/LoginItems.dart';
import 'package:werk/Screens/ChatScreen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool loadingIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              "lib/img/44.png",
              width: 250,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(
                          child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                            // color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Image.asset(
                      "lib/img/hugo-security-service.png",
                      height: 250,
                    ),
                    Visibility(
                      child: CircularProgressIndicator.adaptive(),
                      visible: loadingIndicator,
                    ),
                    LoginTextFieldContainer(
                      theChild: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          icon: Icon(Icons.mail),
                          fillColor: Colors.black,
                          hintText: 'Enter your email',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LoginTextFieldContainer(
                      theChild: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          fillColor: Colors.black,
                          hintText: 'Enter your password',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    LoginButton(
                      theOnPressed: () async {
                        setState(() {
                          loadingIndicator = true;
                        });
                        try {
                          final loggedInUser =
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                          if (loggedInUser != null) {
                            Navigator.pushNamed(context, ChatScreen.id);
                            setState(() {});
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          loadingIndicator = false;
                        });
                      },
                      theText: 'Login',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
