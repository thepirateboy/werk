import 'package:flutter/material.dart';
import 'package:werk/Screens/LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  // const WelcomePAge({Key? key}) : super(key: key);

  static final String id = "WelcomeScreen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 240,
            width: double.infinity,
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
              color: Color(0xff368FFF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60, bottom: 50),
            child: SizedBox(
              height: 300,
              child: Image.asset("lib/img/hugo-83.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Material(
                    // elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff368FFF),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get started",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      minWidth: 200.0,
                      height: 42.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text("Already have an \naccount ?"),
                    SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Material(
                        // elevation: 5,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          minWidth: 200.0,
                          height: 42.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
