// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class CreateBooking extends StatelessWidget {
  const CreateBooking({super.key});

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
        shape: MaterialStatePropertyAll<SmoothRectangleBorder>(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 12,
              cornerSmoothing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget nameOfPerson() => Text(
        'Mr MaliK Umer',
        style: TextStyle(
          color: CreateBooking.paragraphColor,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      );
  Widget inputFieldBooking(String placeholder, final _controller) {
    return (TextField(
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      controller: _controller,
      decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: placeholder,
          hintStyle: TextStyle(color: inputTextColor, letterSpacing: 1)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();

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
                              'Create Booking',
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
                        Column(
                          children: [
                            inputFieldBooking('Time', myController),
                            SizedBox(
                              height: 25,
                            ),
                            inputFieldBooking('Date', myController),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: addCarButton('Create Appointment'),
            )
          ],
        ),
      ),
    );
  }
}
