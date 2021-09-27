import 'dart:typed_data';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: Image.asset(
          //     "lib/img/blob-haikei.png",
          //     width: 150,
          //   ),
          // ),
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
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.center,
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
                    // SizedBox(
                    //   height: 50,
                    // ),
                    Image.asset(
                      "lib/img/hugo-security-service.png",
                      height: 250,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      decoration: BoxDecoration(
                        color: Color(0xffB1E3FF),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          icon: Icon(Icons.mail),
                          fillColor: Colors.black,
                          hintText: 'Enter your email',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      decoration: BoxDecoration(
                        color: Color(0xffB1E3FF),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      child: TextField(
                        obscureText: true,
                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          fillColor: Colors.black,
                          hintText: 'Enter your password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Material(
                      color: Color(0xff368FFF),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
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
