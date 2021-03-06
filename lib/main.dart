import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:werk/Screens/ChatListScreen.dart';
import 'package:werk/Screens/ChatScreen.dart';
import 'package:werk/Screens/LoginScreen.dart';
import 'package:werk/Screens/PersonalChatCreen.dart';
import 'package:werk/Screens/RegistrationScreen.dart';
import 'package:werk/Screens/WelcomeScreen.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        ChatListScreen.id: (context) => ChatListScreen(),
      },
    );
  }
}
