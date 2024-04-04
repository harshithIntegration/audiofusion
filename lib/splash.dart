import 'dart:async';
import 'package:audiofusion/dashbord.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen after 5 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Big logo
                Image.asset(
                  'assets/banner.png',
                  height: 300,
                  width: 300,
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
        ], // <-- Make sure this closing bracket is in the correct position
      ),
    );
  }
}