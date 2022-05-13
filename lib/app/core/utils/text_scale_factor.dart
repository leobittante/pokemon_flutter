import 'package:flutter/material.dart';

double textScaleFactor(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  double width = size.width;
  double textScaleFactor = width / 360;

  return textScaleFactor;
}
