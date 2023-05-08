// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:bmi/controller/colors.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  double bmi;

  SecondScreen(this.bmi, {super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState(bmi);
}

class _SecondScreenState extends State<SecondScreen> {
  double bmi;

  _SecondScreenState(this.bmi);

  String getResult(double bmi) {
    if (bmi > 18.5 && bmi <= 24.9) {
      return 'Your weight is normal and healthy.';
    } else if (bmi > 25 && bmi <= 29.9) {
      return 'You are a bit overweight and '
          'you need to review your diet, '
          'lifestyle and exercise on a regular basis.';
    } else if (bmi > 30 && bmi <= 34.90) {
      return 'You are moderately obese and '
          'need to make drastic changes in your diet';
    }
    return '';
  }

  String getPath(double bmi) {
    if (bmi > 18.5 && bmi <= 24.9) {
      return 'images/وزنك ناقص.png';
    } else if (bmi > 25 && bmi <= 29.9) {
      return 'images/بدانة متوسطة.png';
    } else if (bmi > 30 && bmi <= 34.90) {
      return 'images/زائد بعض الشيء.png';
    }
    return '';
  }

  late String result = getResult(bmi);
  late String path = getPath(bmi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColorsB,
        centerTitle: true,
        title: const Text(
          'RESULT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Result : ${bmi.round()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 5.0, // gap between adjacent chips
                children: [
                  Text(
                    result,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Image.asset(
                  path,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
