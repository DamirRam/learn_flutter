import 'package:first_app/pages/register_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Register form demo',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: RegisterForm()),
    ),
  );
}
