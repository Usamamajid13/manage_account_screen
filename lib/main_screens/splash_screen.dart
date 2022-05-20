import 'dart:async';
import 'package:flutter/material.dart';
import 'package:manage_account_screen/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height,
      ),
    ));
  }

  splashNavigator() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, bottomNavigationBarScreenRoute);
    });
  }
}
