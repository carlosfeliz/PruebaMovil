import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:prueva_movil_clientes_app/pages/principal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'principal': (_) => const Principal(),
      },
      home: splash(),
    );
  }

  AnimatedSplashScreen splash() {
    return AnimatedSplashScreen(
        splash: Image.asset('assets/images/logo.png'),
        nextScreen: const Principal(),
        splashTransition: SplashTransition.scaleTransition);
  }
}
