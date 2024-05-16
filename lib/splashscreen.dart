import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sunkonnect/loginpage.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/sunkpo.png')),
          SizedBox(
            height: 15,
          ),
          Text(
            'Konnect @ Sun Kpo',
            style: TextStyle(
                color: Colours.korange,
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ));
  }
}
