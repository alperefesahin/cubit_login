import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
      child: Text(
        'Register and Join Us!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
