import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclone_app/responsive/mobile_screen_layout.dart';
import 'package:instaclone_app/responsive/responsive_layout_screen.dart';
import 'package:instaclone_app/responsive/web_screen_layout.dart';
import 'package:instaclone_app/screens/login_screen.dart';
import 'package:instaclone_app/screens/signup_screen.dart';
import 'package:instaclone_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBMebs3TNOffcL3GnLFJ8G7nh9Q2GaRpvw",
            authDomain: "instaclone-89523.firebaseapp.com",
            projectId: "instaclone-89523",
            storageBucket: "instaclone-89523.appspot.com",
            messagingSenderId: "528672923573",
            appId: "1:528672923573:web:183ddb199bbdd8b4a343fc"));
  } else {
    //mobile
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instaclone',
        theme: ThemeData(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        // home: ResponsiveLayout(
        //     mobileScreenLayout: MobileScreenLayout(),
        //     webScreenLayout: WebScreenLayout()));
        home: SignupScreen());
  }
}
