import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Todo',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 60, fontWeight: FontWeight.w400, color: Colors.orange),
    );
  }
}
