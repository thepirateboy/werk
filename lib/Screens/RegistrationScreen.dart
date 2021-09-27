import 'package:flutter/material.dart';
import 'package:werk/Items/LoginItems.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = "RegistrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(
                          child: Text(
                        "Create an account",
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
                      "lib/img/hugo-success-1.png",
                      height: 250,
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
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    LoginTextFieldContainer(
                      theChild: TextField(
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
                    LoginButton(
                      theOnpressed: () {},
                      theText: 'Register',
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
