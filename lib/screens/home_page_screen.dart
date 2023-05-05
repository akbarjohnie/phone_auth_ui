import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_mobile_auth/screens/phone_auth_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      body: Center(
        child:
            //     Container(
            //   height: 44.0,
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [Colors.pink, Colors.green])),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //         primary: Colors.transparent, shadowColor: Colors.transparent),
            //     child: Text('Elevated Button'),
            //   ),
            // ),
            Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.green],
            ),
          ),
          child: MaterialButton(
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
            // color: Colors.blue,
            child: const Text(
              'With phone number',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
