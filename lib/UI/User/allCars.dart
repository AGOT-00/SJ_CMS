// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proj/functions.dart';

class allCars extends StatefulWidget {
  const allCars({super.key});

  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);
  static const String forMale = 'Mr.';
  static bool carsArePresent = false;
  static const Color addedCarBgColour = Color.fromRGBO(127, 92, 237, .27);
  static const Color addedCarBorderColour = Color.fromRGBO(127, 92, 237, 1);
  static const Color deleteIconBgColour = Color.fromRGBO(248, 113, 113, 1);

  @override
  State<allCars> createState() => _allCarsState();
}

class _allCarsState extends State<allCars> {
  Widget avatarOfPerson() => CircleAvatar(
        backgroundImage: AssetImage('assets/avatar.png'),
        radius: 55,
      );

  Widget nameOfPerson() => Text(
        '${allCars.forMale}  ${LoggedinUser?.name}',
        style: TextStyle(
          color: allCars.paragraphColor,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      );

  Widget warningBox(String warningText) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 168, 89, .4),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromRGBO(255, 168, 89, 1),
            width: 1,
          ),
        ),
        child: Text(
          warningText,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget addCarButton(String btnText) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            !allCars.carsArePresent
                ? allCars.carsArePresent = true
                : allCars.carsArePresent = false;
          });
        },
        // ignore: sort_child_properties_last
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.fromLTRB(40, 20, 40, 20)),
          backgroundColor: MaterialStatePropertyAll<Color>(allCars.btnColor),
          shape: MaterialStatePropertyAll<SmoothRectangleBorder>(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 12,
              cornerSmoothing: 0.5,
            ),
          ),
        ),
        ));
  }

  Widget addedCarDetail(
      String carName, String carRegistrationNumber, String carAverage) {
    return Container(
      decoration: BoxDecoration(
        color: allCars.addedCarBgColour,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: allCars.addedCarBorderColour,
          width: 2,
        ),
      ),
      padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Image(
                image: AssetImage('assets/carIcon.png'),
                width: 25 * 2.2,
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        carName,
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        carRegistrationNumber,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$carAverage KM/L',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: 25 * 2,
                  height: 25 * 2,
                  decoration: BoxDecoration(
                    color: allCars.deleteIconBgColour,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.trashCan,
                    color: Color.fromRGBO(127, 29, 29, 1),
                    size: 25,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(22, 22, 26, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      avatarOfPerson(),
                      SizedBox(
                        height: 25,
                      ),
                      nameOfPerson(),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                margin: EdgeInsets.fromLTRB(0, 35, 0, 35),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Your Cars',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     !allCars.carsArePresent
                    //         ? warningBox('No Cars Found. Tap + to add a car')
                    //         : Text(''),
                    //   ],
                    // ),
                    addedCarDetail('Toyota Corolla', 'LEA-2011', '15'),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
          addCarButton('+ Add Car')
        ],
      ),
    );
  }
}
