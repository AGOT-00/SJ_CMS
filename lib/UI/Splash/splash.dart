import 'package:flutter/material.dart';
import '../User/Login/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _navigatetologin() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const login()));
  }

  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(22, 22, 26, 1),
        body: Center(
          child: Image.asset(
            'assets/SplashLogo.png',
            height: 0.35 * MediaQuery.of(context).size.height,
            width: 0.45 * MediaQuery.of(context).size.width,
          ),
        ));
  }
}
