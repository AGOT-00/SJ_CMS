// ignore_for_file: avoid_print, non_constant_identifier_names, unused_import, empty_constructor_bodies, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './UI/User/Login/login.dart';

UserClass? LoggedinUser;

const Color btnColor = Color.fromRGBO(127, 90, 240, 1);

bool phoneNumberchecks(String phone) {
  if(phone.length == 13){
    return true;
  }
  else{
    return false;
  }
}

FocusNode? focus(int limit){
  if(limit==13){
    return FocusNode();
  }
  return null;
}

List<TextInputFormatter>? obj(int limit) {
  if (limit > 0) {
      return [
        LengthLimitingTextInputFormatter(limit),
      ];
  }
  return null;
}

SizedBox PhoneNumberField(TextEditingController LoginController){
  return SizedBox(
                    width: 330,
                    child: Focus(
                        child:inputField(placeholder:'+923XXXXXXXXX', ifcontroller:LoginController,
                            type:TextInputType.phone,iconobj: Icons.phone,limit: 13),
                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            print('\n\nFocused\n\n\n');
                          } else {
                            print('\n\nUnfocused\n\n\n');
                          }
                        }));
}

SizedBox OTPField(TextEditingController OTPController){
  return  SizedBox(
                    width: 330,
                    child:inputField(placeholder: 'OTP', ifcontroller: OTPController, type: TextInputType.number, iconobj: Icons.password)
                );
}

Widget inputField({required String placeholder,required final ifcontroller,required TextInputType type,
      required IconData iconobj,int limit=0,FocusNode? Obj}) {
  return Container(
    // decoration: BoxDecoration(
    //   border: Border.all(width: 1, color: Colors.grey),
    //   borderRadius: BorderRadius.circular(10),
    // ),
    child: (TextField(
      inputFormatters: obj(limit),
      focusNode: focus(limit),
      textAlign: TextAlign.left,
      keyboardType: type,
      controller: ifcontroller,
      decoration: InputDecoration(
          // ignore: prefer_const_constructors
          prefixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            // ignore: prefer_const_constructors
            child: Icon(
              iconobj,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(15),
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
              //style: BorderStyle,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: placeholder,
          hintStyle:
              const TextStyle(color: login.inputTextColor, letterSpacing: 1)),
    )),
  );
}

void onPressFunction() {
  print('hello');
}

// ignore: use_function_type_syntax_for_parameters
dynamic button(String data, dynamic functionONpress) {
  return ElevatedButton(
      onPressed: functionONpress,
      // ignore: sort_child_properties_last
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.fromLTRB(40, 20, 40, 20)),
        backgroundColor: const MaterialStatePropertyAll<Color>(btnColor),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ));
}

SizedBox spaceyaxis() {
  return const SizedBox(
    height: 20,
  );
}

SizedBox spacexaxis() {
  return const SizedBox(
    width: 20,
  );
}

class Database {
  Database() {}

  Future<UserClass?> readUserfromDatabase(String phone) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc(phone);
    final Userdata = await docUser.get();

    if (Userdata.exists) {
      UserClass Data = UserClass.fromJson(Userdata.data()!);
      return Data;
    }
    return null;
  }

  void saveUsertoDatabase(UserClass obj) async {
    final docUser =
        FirebaseFirestore.instance.collection('Users').doc(obj.phone);
    final json_obj = obj.toJson();
    await docUser.set(json_obj);
  }
}

class UserClass {
  String? name;
  String? phone;
  String? cnic;
  bool? active;

  UserClass(
      {required this.name,
      required this.phone,
      this.active = false,
      this.cnic = ''});

  Map<String, dynamic> toJson() =>
      {'phone': phone, 'name': name, 'cnic': cnic, 'active': active};

  static UserClass fromJson(Map<String, dynamic> Obj) => UserClass(
      name: Obj['name'],
      phone: Obj['phone'],
      cnic: Obj['cnic'],
      active: Obj['active']);

}
