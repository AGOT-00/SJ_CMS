// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, file_names, non_constant_identifier_names, unnecessary_new, unnecessary_brace_in_string_interps, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sda_app/UI/User/Login/login.dart';
import '/functions.dart';
import '/classes.dart';

import 'AddCarUI.dart';
import '../User/dashboard.dart';

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
  loggedinUser LoggedIn = loggedinUser();
  SelectedCar selectedCar = SelectedCar();
  Map<String, Car> CarsList = {};

  _allCarsState() {
    getCarlist();
  }

  //fetch the list of cars from the database
  void getCarlist() async {
    Database db = Database();
    Map<String, Car>? cars =
      await  db.readListCarfromDatabase(LoggedIn.getLoggedinUser()?.phone);
    setState(() {
      CarsList = cars!;
    });
    if (CarsList.isNotEmpty) {
      allCars.carsArePresent = true;
    } else {
      allCars.carsArePresent = false;
      CarsList = {};
    }
    //(context as Element).reassemble();
    print('\nCar List has been updated\n');
  }

  //Removes LoggedinUser from the App and Redirects to Login Page
  void signout() {
    loggedinUser LoggedIn = loggedinUser();
    LoggedIn.signout();
  }

  //Removes the car from the database
  void removeCar(Car car) async {
    Database db = Database();
    db.deleteCarfromDatabase(car);
    getCarlist();
  }

  //Picture of User
  Widget avatarOfPerson() => CircleAvatar(
        backgroundImage: AssetImage('assets/avatar.png'),
        radius: 55,
      );

  //Name of User
  Widget nameOfPerson() => Text(
        '${LoggedIn.getLoggedinUser()?.name}',
        style: TextStyle(
          color: allCars.paragraphColor,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      );

  //Warnings
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

  //Add Car Button
  Widget addCarButton(String btnText) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            !allCars.carsArePresent
                ? allCars.carsArePresent = true
                : allCars.carsArePresent = false;
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddCarUI()));
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

  //Car Details Modular Function
  Widget addedCarDetail(Car car) {
    String carName = car.cmake!,
        carRegistrationNumber = car.carRegistrationNumber!,
        carAverage = car.mileage!.toString();

    print('\nCar Details : \nReg Number = ${carRegistrationNumber}\n');

    return Column(
      children: [
        InkWell(
          onTap: () {
            selectedCar.setSelectedCar(car);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
          child: Container(
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
                      onTap: () {
                        removeCar(car);
                      },
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
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        !allCars.carsArePresent
                            ? warningBox('No Cars Found. Tap + to add a car')
                            : Text(''),
                      ],
                    ),
                    for (var i in CarsList.entries) addedCarDetail(i.value),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              addCarButton('+ Add Car'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              InkWell(
                onTap: () {
                  signout();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


//+923174120910