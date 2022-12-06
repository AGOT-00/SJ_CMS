// ignore_for_file: prefer_const_constructors, unused_import, non_constant_identifier_names, must_be_immutable, prefer_const_constructors_in_immutables, unnecessary_string_escapes, avoid_print, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';
import 'package:sda_app/UI/Car/allCars.dart';
import 'package:sda_app/UI/Car/caravg.dart';
import '/functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Car/create_booking.dart';
import '/classes.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);
  static bool carsArePresent = false;
  static const Color addedCarBgColour = Color.fromRGBO(127, 92, 237, .27);
  static const Color addedCarBorderColour = Color.fromRGBO(127, 92, 237, 1);
  static const Color deleteIconBgColour = Color.fromRGBO(248, 113, 113, 1);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  loggedinUser LoggedinUser = loggedinUser();
  SelectedCar selectedCar = SelectedCar();
  
  Map<String, Booking> Bookinglist = {};

  void getbookinglist() async {
    Database db = Database();
    Map<String, Booking>? list = await db.readbookingfromdb(
        selectedCar.getSelectedCar()?.carRegistrationNumber);

    setState(() {
      Bookinglist = list!;
    });
    print('\Booking List has been updated\n');
  }

  _DashboardState() {
    getbookinglist();
  }

  Widget avatarOfPerson() => CircleAvatar(
        backgroundImage: AssetImage('assets/avatar.png'),
        radius: 35,
      );

  Widget addCarButton(String btnText) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CreateBooking()));
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
          backgroundColor: MaterialStatePropertyAll<Color>(Dashboard.btnColor),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ));
  }

  Widget nameOfPerson() => Text(
        '${LoggedinUser.getLoggedinUser()?.name}',
        style: TextStyle(
          color: Dashboard.paragraphColor,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      );

  Row carDetails(Booking obj) {
    print('\n${obj.CarRegistration}\n');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        //print('Hello World');
        Text(
          '${obj.BookingDate}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            height: 1.2,
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Text(
          '${obj.BookingTime}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(22, 22, 26, 1),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 60, 10, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      topBar(),
                      avatarOfPerson(),
                      nameOfPerson(),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                        image: AssetImage('assets/carIcon.png'),
                        width: 25 * 4,
                      ),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            '${selectedCar.getSelectedCar()!.cmake}  ${selectedCar.getSelectedCar()!.model}',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${selectedCar.getSelectedCar()!.carRegistrationNumber}',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                color: Color.fromARGB(179, 216, 216, 216),
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
                          children: [
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateAvg()));
                                },
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 150,
                                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(5, 150, 105, 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Car Average',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 19),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '${selectedCar.getSelectedCar()!.mileage}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 90,
                                              height: 1.2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 150,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(37, 99, 235, 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Last Service',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 19),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '96',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 90,
                                              height: 1.2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(228, 38, 38, 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        'Your Appointment',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 19),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      for (var i in Bookinglist.entries)
                                        carDetails(i.value),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: addCarButton('Book Appointment'),
            )
          ],
        ),
      ),
    );
  }
}

class topBar extends StatelessWidget {
  const topBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => allCars()),
                  (route) => false);
            },
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
