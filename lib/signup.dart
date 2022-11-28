// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'login.dart';
import 'functions.dart';
// ignore: prefer_const_constructors

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);
  static final phone = TextEditingController();
  static final otp = TextEditingController();
  static final name = TextEditingController();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(22, 22, 26, 1),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WELCOME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create Your Account',
                          style: TextStyle(
                            fontSize: 22,
                            color: SignUp.paragraphColor,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                PhoneNumberField(SignUp.phone),
                SizedBox(
                  height: 10,
                ),
                OTPField(SignUp.otp),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 330,
                    child:inputField(placeholder: 'Csutomer Name', ifcontroller: SignUp.name, type: TextInputType.name, iconobj: Icons.verified_user)
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      print('hello world');
                    },
                    // ignore: sort_child_properties_last
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.fromLTRB(40, 20, 40, 20)),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(SignUp.btnColor),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Already Have an account ?',
                  style: TextStyle(
                    fontSize: 15,
                    color: SignUp.paragraphColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (_navigatetologin),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: SignUp.btnColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            )
          ]),
    );
  }

  _navigatetologin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const login())));
  }
}
