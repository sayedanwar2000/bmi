import 'dart:async';

import 'package:bmi/controller/components/component.dart';
import 'package:bmi/view/calculator_bim/calculator_bim_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigateAndFinish(context, const CalculatorBMIScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.60,
          height: MediaQuery.of(context).size.height * 0.60,
          child: Image.asset(
            'images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
