import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imsnitc/Dashboard.dart';
import 'dart:async';

class Login extends StatelessWidget {
  const Login({super.key});

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
        serverClientId:
            '392997688760-dlt5g8sgesklgjhpjcotu75ks00oderq.apps.googleusercontent.com');
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final email = account.email;

        if (email.endsWith('@nitc.ac.in')) {
          final GoogleSignInAuthentication auth = await account.authentication;
          final idToken = auth.idToken;
          print("Id token received**: $idToken");

          if (idToken != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(idtoken: idToken),
              ),
            );

            _startAutoSignOutTimer(context, googleSignIn);
          } else {
            print('idToken is null');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to get idToken from Google'),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else {
          await googleSignIn.signOut();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Only @nitc.ac.in emails are allowed'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (error) {
      print('Google Sign-In Error: $error');
    }
  }

  void _startAutoSignOutTimer(BuildContext context, GoogleSignIn googleSignIn) {
    Timer(Duration(seconds: 120), () async {
      await googleSignIn.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
      print("User signed out due to inactivity.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _handleGoogleSignIn(context),
            child: Image.asset(
              'lib/images/google.jpg',
              height: 46,
            ),
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
