// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, no_leading_underscores_for_local_identifiers,non_constant_identifier_names, avoid_print, unused_import, body_might_complete_normally_nullable, unused_local_variable, unnecessary_cast

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proj/AddCarUI.dart';
import 'signup.dart';
import 'Admin_Mode.dart';
import 'functions.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});
  
  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);

  static final PhoneController = TextEditingController();
  static final OTPController = TextEditingController();

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  final phonecontroller = TextEditingController();
  final otpcontroller = TextEditingController();
  String OTP="111222";
  UserClass? OTPUser;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

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
                      Text('Login Your Account',
                          style: TextStyle(
                            fontSize: 22,
                            color: login.paragraphColor,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Focus(child: PhoneNumberField(login.PhoneController),onFocusChange: (hasFocus){
                  if(!hasFocus){
                    
                    SendOTP();
                    print('FOcus Lost');
                  }
                },),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 330,
                    child:inputField(placeholder: 'OTP', ifcontroller:  login.OTPController, type: TextInputType.number, iconobj: Icons.password,limit: 6),),
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
                      PerformValidation();
                    },
                    // onPressed: () async {
                    //   await FirebaseAuth.instance.verifyPhoneNumber(
                    //     phoneNumber: '+923458069011',
                    //     verificationCompleted:
                    //         (PhoneAuthCredential credential) {},
                    //     verificationFailed: (FirebaseAuthException e) {},
                    //     codeSent: (String verificationId, int? resendToken) {},
                    //     codeAutoRetrievalTimeout: (String verificationId) {},
                    //   );
                    //},
                    // ignore: sort_child_properties_last
                    child: Text(
                      'Sign INO',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.fromLTRB(40, 20, 40, 20)),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(login.btnColor),
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
                  'Dont Have an Account?',
                  style: TextStyle(
                    fontSize: 15,
                    color: login.paragraphColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  }), //_navigatetosignup()),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: login.btnColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpAdmin()));
                  },
                  child: Text(
                    'Admin Mode',
                    style: TextStyle(
                        color: Colors.red,
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
  
    void SendOTP() async{
    dynamic tempobj = await getUserCheckdata();
    print(tempobj);
    if(tempobj is String){
      print(tempobj);
    }else if(tempobj is UserClass){
      OTPUser = tempobj as UserClass;
      print("USER OTP SEND FUNCTION");
    }
    else{
      print("ERROR");
    }
  }
  //+923174120910
  void PerformValidation()
  {
    if(login.PhoneController.text == OTPUser?.phone && login.OTPController.text == OTP.toString()){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AddCarUI()));
    }
    else{
      print("\nWrong Information\n\n");
    }
  }
  
  dynamic getUserCheckdata() async {
    Database GetUserObj = Database();
    String phoneNumber = login.PhoneController.text;
    if(phoneNumberchecks(phoneNumber)==false){
      return ("\nError in Phone Number\n");
    }
    else{
      UserClass? obj = await GetUserObj.readUserfromDatabase(phoneNumber);
      if (obj != null) {
        print(obj.name);
        return obj;
      }
      else{
        return("User Not Found");
      }
    }
  }

  @override
  void dispose() {
    phonecontroller.dispose();
    otpcontroller.dispose();
    super.dispose();
  }
}
