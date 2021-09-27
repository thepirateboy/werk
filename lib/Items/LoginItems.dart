import 'package:flutter/material.dart';

class LoginTextFieldContainer extends StatelessWidget {
  // const LoginTextFieldContainer({
  //   Key? key,
  // }) : super(key: key);

  final Widget theChild;

  LoginTextFieldContainer({required this.theChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: Color(0xffB1E3FF),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: theChild,
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback theOnpressed;
  final String theText;

  LoginButton({required this.theOnpressed, required this.theText});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff368FFF),
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          theText,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: theOnpressed,
      ),
    );
  }
}
