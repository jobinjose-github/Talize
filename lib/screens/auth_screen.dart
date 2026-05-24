import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  void _handleSignIn() {
    // TODO: wire the Google sign-in flow into your auth layer.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'app-logo',
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 70,
                  height: 70,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome to Talize',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 223, 223, 223),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Connect your account to start managing your assets with minimalist precision.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 86, 86, 86),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              SignInButton(
                Buttons.google,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
