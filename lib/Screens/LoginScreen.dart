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
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "lib/img/blob-haikei.png",
              width: 150,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "lib/img/blob-haikei.png",
              width: 150,
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
                      padding: EdgeInsets.only(top: 150),
                      child: Center(
                          child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                            // color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffEAE0F9),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          hintText: 'Enter your email',
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.red, width: 2.0),
                          //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          // ),
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide:
                          //       BorderSide(color: Colors.black, width: 1.0),
                          //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          // ),
                          // focusedBorder: OutlineInputBorder(
                          //   borderSide:
                          //       BorderSide(color: Colors.blueAccent, width: 2.0),
                          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Material(
                      color: Color(0xffDC4624),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: MaterialButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Expanded(
                    //   child: SizedBox(
                    //     height: 0,
                    //   ),
                    // ),
                    // Stack(
                    //   children: [
                    //     Container(
                    //       child: Image(
                    //         image: AssetImage("lib/img/layered-waves-haikei.png"),
                    //       ),
                    //     ),
                    //     Positioned(
                    //       left: 50,
                    //       child: Container(
                    //         child: Image.asset("lib/img/3d-flame-19.png"),
                    //         height: 300,
                    //         width: double.infinity,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Flexible(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 55, top: 100),
                    //   ),
                    // )
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
