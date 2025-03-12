import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Image.asset('lib/images/since 1961.jpg', width: 200),
          ),
          const SizedBox(height: 20),
          const Text(
            '---------------------------------continue with---------------------------------',
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 96, 93, 93),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/google.jpg',
                height: 46,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'By continuing you agree to our Terms of Use',
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 100, 95, 95),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
