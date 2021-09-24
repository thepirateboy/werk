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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Center(
                child: Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55),
            child: SizedBox(
              child: Image.asset("lib/img/3d-flame-19.png"),
              height: 300,
            ),
          )
        ],
      ),
    );
  }
}
