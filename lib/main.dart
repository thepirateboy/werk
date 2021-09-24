import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:werk/Screens/LoginScreen.dart';
import 'package:werk/Screens/WelcomeScreen.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(WerkApp());
}

class WerkApp extends StatelessWidget {
  // const WerkApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(),

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
