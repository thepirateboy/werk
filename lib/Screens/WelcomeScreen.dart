import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  // const WelcomePAge({Key? key}) : super(key: key);

  static final String id = "welcomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            // color: Colors.green[400],
            child: Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
            ),
          ),
        ],
      ),
    );
  }
}
