// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

void navigateto(context, Widget Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

void navigateAndFinish(context, Widget Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    (route) => false);

Widget defaultButton({
  String? text,
  required function,
  dynamic color,
  dynamic colorText,
  widget,
  double? Width,
  Radius,
}) =>
    Container(
      width: Width ?? double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Radius??10),
      ),
      child: MaterialButton(
        onPressed: function,
        child: widget ??
            Text(
              text ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorText ?? Colors.white,
              ),
            ),
      ),
    );

