import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_mobile_auth/constants/color_constants.dart';
import 'package:simple_mobile_auth/screens/phone_auth_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: homePageGradient,
          ),
          child: const _MyButton(),
        ),
      ),
    );
  }
}

class _MyButton extends StatelessWidget {
  const _MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 150,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PhoneAuthScreen(),
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: const Text(
        'With phone number',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
