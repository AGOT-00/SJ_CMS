// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, no_leading_underscores_for_local_identifiers, avoid_print, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'login.dart';
import 'functions.dart';
// ignore: prefer_const_constructors

class SignUpAdmin extends StatefulWidget {
  const SignUpAdmin({super.key});

  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);
  static final Name = TextEditingController();
  static final Phone = TextEditingController();

  @override
  State<SignUpAdmin> createState() => _SignUpAdminState();
}

class _SignUpAdminState extends State<SignUpAdmin> {
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
                    'WELCOME to System Admin',
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
                      Text('Enter Customer Data',
                          style: TextStyle(
                            fontSize: 22,
                            color: SignUpAdmin.paragraphColor,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 330,
                    child: inputField(placeholder:'Customer Name', ifcontroller:SignUpAdmin.Name,
                        type:TextInputType.name,iconobj: Icons.person)),
                SizedBox(
                  height: 10,
                ),
                PhoneNumberField(SignUpAdmin.Phone),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      savetodatabase();
                    },
                    // ignore: sort_child_properties_last
                    child: Text(
                      ' Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.fromLTRB(40, 20, 40, 20)),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(SignUpAdmin.btnColor),
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
                  height: 10,
                ),
                InkWell(
                  onTap: (_navigatetologin),
                  child: Text(
                    'Exit Admin Mode',
                    style: TextStyle(
                        color: SignUpAdmin.btnColor,
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

  void savetodatabase() {
    UserClass Obj = UserClass(
        name: SignUpAdmin.Name.text,
        phone: SignUpAdmin.Phone.text,
        active: true);
    print(Obj);
    Database Init = Database();
    Init.saveUsertoDatabase(Obj);
  }

  _navigatetologin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const login())));
  }
}
