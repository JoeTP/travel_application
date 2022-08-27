import 'package:flutter/material.dart';

import 'colors.dart';

class BigText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  BigText(
      {Key? key, this.size = 30, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  MediumText(
      {Key? key,
      this.size = 20,
      required this.text,
      this.color = Colors.black87})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  SmallText(
      {Key? key, this.size = 16, required this.text, this.color = const Color(0xFF878593)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
