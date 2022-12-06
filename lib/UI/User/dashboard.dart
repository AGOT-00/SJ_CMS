// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proj/functions.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);
  static const String forMale = 'Mr.';
  static bool carsArePresent = false;
  static const Color addedCarBgColour = Color.fromRGBO(127, 92, 237, .27);
  static const Color addedCarBorderColour = Color.fromRGBO(127, 92, 237, 1);
  static const Color deleteIconBgColour = Color.fromRGBO(248, 113, 113, 1);

  Widget avatarOfPerson() => CircleAvatar(
        backgroundImage: AssetImage('assets/avatar.png'),
        radius: 40,
      );
  
  Widget addCarButton(String btnText) {
    return ElevatedButton(
        onPressed: () {},
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
          backgroundColor: MaterialStatePropertyAll<Color>(btnColor),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ));
  }

  Widget nameOfPerson() => Text(
        '${LoggedinUser?.name}',
        style: TextStyle(
          color: Dashboard.paragraphColor,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      );
      
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
                          const Text(
                            'Toyota Corolla',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'LEA-2011',
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
                                onTap: () {},
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
                                          '24',
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
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        'Your Appointments',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 19),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            'Jan 21, 2021',
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
                                            '10:00 AM',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              height: 1.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            'Jan 21, 2021',
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
                                            '10:00 AM',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              height: 1.2,
                                            ),
                                          ),
                                        ],
                                      )
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
