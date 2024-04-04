import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/screens/home_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    gotoSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/netflix.json"),
      ),
    );
  }

  Future<void> gotoSplash() async {
    await Future.delayed(
      Duration(seconds: 4),
    );
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => Circular_Splash()));
  }
}

class Circular_Splash extends StatefulWidget {
  const Circular_Splash({super.key});

  @override
  State<Circular_Splash> createState() => _Circular_SplashState();
}

class _Circular_SplashState extends State<Circular_Splash> {
  @override
  void initState() {
    gotoHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 5.0,
        ),
      ),
    );
  }

  Future<void> gotoHome() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home_Screen()));
  }
}
