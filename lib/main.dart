import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:werk/Screens/WelcomeScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));
  runApp(WerkApp());
}

class WerkApp extends StatelessWidget {
  // const WerkApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // appBarTheme: AppBarTheme(
          //   // backwardsCompatibility: false, // 1
          //   systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
          // ),
          ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
