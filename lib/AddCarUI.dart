// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'functions.dart';

class AddCarUI extends StatefulWidget {
  const AddCarUI({super.key});

  static void N() {
    print("object");
  }

  @override
  State<AddCarUI> createState() => _AddCarUIState();
}

class _AddCarUIState extends State<AddCarUI> {
  static final Obj = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(22, 22, 26, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: const AssetImage('assets/SplashLogo.png'),
                      fit: BoxFit.fill),
                ),
              ),
              spaceyaxis(),
              SizedBox(
                child: const Text(
                  'Mr. Umer Malik',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          //Add Car + Fields
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 330,
                height: 50,
                child: const Text(
                  'ADD CAR',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
              SizedBox(
                  width: 330,
                    child:inputField(placeholder: 'Car Make', ifcontroller: Obj, type: TextInputType.number, iconobj: Icons.password)),spaceyaxis(),
              spaceyaxis(),
              SizedBox(
                  width: 330,
                    child:inputField(placeholder: 'Registration Number', ifcontroller: Obj, type: TextInputType.number, iconobj: Icons.password)),spaceyaxis(),
              spaceyaxis(),
              SizedBox(
                  width: 330,
                    child:inputField(placeholder: 'Car Model', ifcontroller: Obj, type: TextInputType.number, iconobj: Icons.password)),spaceyaxis(),
              spaceyaxis(),
              SizedBox(
                  width: 330,
                    child:inputField(placeholder: 'Car', ifcontroller: Obj, type: TextInputType.number, iconobj: Icons.password)),spaceyaxis(),
              spaceyaxis(),
              SizedBox(
                  width: 330,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 160,
                          child:inputField(placeholder: 'KM', ifcontroller: Obj, type: TextInputType.number, iconobj: Icons.password)),spaceyaxis(),
                      spaceyaxis(),
                      SizedBox(
                          width: 160,
                          child:inputField(placeholder: 'L', ifcontroller: Obj, type: TextInputType.number, iconobj: Icons.password)),spaceyaxis(),

                    ],
                  )),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.info, color: Colors.grey),
                  SizedBox(
                    child: InkWell(
                      onTap: (() {
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) => const SignUp()));
                      }), //_navigatetosignup()),
                      child: Text(
                        ' By Adding Car, You Agree to our Terms and Conditions',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 330,
                child: button('Ani Diya Kaam Kr la', () {
                  AddCarUI.N();
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void Null() {}
}