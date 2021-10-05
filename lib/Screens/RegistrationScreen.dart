import 'package:flutter/material.dart';
import 'package:werk/Items/LoginItems.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = "RegistrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
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
                    Image.asset(
                      "lib/img/hugo-success-1.png",
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
                        print("Email = $email \nPassword = $password");
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          loadingIndicator = false;
                        });
                      },
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
