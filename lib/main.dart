import 'package:ar_edu/screens/home_page.dart';
import 'package:ar_edu/screens/login.dart';
import 'package:ar_edu/screens/onboarding.dart';
import 'package:ar_edu/screens/sign_up.dart';
import 'package:ar_edu/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AR EDU',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onBoarding': (context) => const OnBoarding(),
        '/homePage': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const Register(),
      },
    );

  }
}


