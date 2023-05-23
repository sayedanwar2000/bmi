// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:bmi/controller/colors.dart';
import 'package:bmi/controller/components/component.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatefulWidget {
  double bmi;

  SecondScreen(this.bmi, {super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState(bmi);
}

class _SecondScreenState extends State<SecondScreen> {
  double bmi;
  final Uri emailLaunchUri = Uri.parse('');
  final Uri whatsAppLaunchUri = Uri.parse('whatsapp://send?phone=+201151763742' +
  '&text=${Uri.encodeComponent('Hello I need your help')}');

  _SecondScreenState(this.bmi);

  dynamic images = {
    0: [
      'images/الافطار  نحيف.png',
      'images/الغذاء نحيف.png',
      'images/نحيف العشاء.png'
    ],
    1: [
      'images/مثالى الفطار.png',
      'images/مثالى الغذاء.png',
      'images/مثالى العشاء.png'
    ],
    2: [
      'images/سمين الإفطار.png',
      'images/سمين الغذاء.png',
      'images/سمين العشاء.png'
    ],
  };

  String getResult(double bmi) {
    if (bmi <= 18.5) {
      return 'You are skinny and need to organize meals';
    } else if (bmi < 25) {
      return 'Your weight is perfect.';
    } else {
      return 'You are fat and need to organize meals.';
    }
  }

  int getPath(double bmi) {
    if (bmi <= 18.5) {
      return 0;
    } else if (bmi < 25) {
      return 1;
    } else {
      return 2;
    }
  }

  late String result = getResult(bmi);
  late int path = getPath(bmi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
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
                'Result',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                images[path][0],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                images[path][1],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                images[path][2],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'If you would like more information,'
                ' please contact us at',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultButton(
                    function: () async {
                      try {
                        launchUrl(whatsAppLaunchUri);
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: Colors.white,
                    Width: 100,
                    widget: Image.asset(
                      'images/whatsapp-logo.png',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  defaultButton(
                    function: () {},
                    color: Colors.white,
                    Width: 100,
                    widget: Image.asset(
                      'images/gmail-logo-on-transparent-white-background-free-vector.jpg',
                      height: 70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
