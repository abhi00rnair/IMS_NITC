import 'package:flutter/material.dart';
import 'package:imsnitc/Dashboard.dart';
import 'package:imsnitc/Login.dart';
import 'package:imsnitc/SIGNIN.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
