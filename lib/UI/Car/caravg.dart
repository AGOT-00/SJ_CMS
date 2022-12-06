// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unused_local_variable, avoid_unnecessary_containers, camel_case_types

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import '/UI/User/dashboard.dart';
import '/functions.dart';
import '/classes.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateAvg extends StatefulWidget {
  const UpdateAvg({super.key});

  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);
  static bool carsArePresent = false;
  static const Color addedCarBgColour = Color.fromRGBO(127, 92, 237, .27);
  static const Color addedCarBorderColour = Color.fromRGBO(127, 92, 237, 1);
  static const Color deleteIconBgColour = Color.fromRGBO(248, 113, 113, 1);

  @override
  State<UpdateAvg> createState() => _UpdateAvgState();
}

class _UpdateAvgState extends State<UpdateAvg> {

  //Controllers
  final loggedinUser LoggedIn = loggedinUser();
  SelectedCar selectedCar = SelectedCar();

  TextEditingController KM = TextEditingController();

  TextEditingController L = TextEditingController();

//Saves the car Averages to the database
  void savetodb() {
    Database db = Database();
    selectedCar.getSelectedCar()?.mileage =
        (int.parse(KM.text) / int.parse(L.text)).toStringAsFixed(0);
    db.SaveaCartoDatabase(
        LoggedIn.getLoggedinUser()!.phone!, selectedCar.getSelectedCar()!);

    showSnackBar(context, 'Car Average Updated');
  }

//USer Icon
  Widget avatarOfPerson() => CircleAvatar(
        backgroundImage: AssetImage('assets/avatar.png'),
        radius: 35,
      );

//Add Booking Button Modular Code
  Widget addBookingButton(String btnText) {
    return ElevatedButton(
      onPressed: () {
        savetodb();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
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
        backgroundColor: MaterialStatePropertyAll<Color>(UpdateAvg.btnColor),
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

//User Name
  Widget nameOfPerson() => Text(
        '${LoggedIn.getLoggedinUser()?.name}',
        style: TextStyle(
          color: UpdateAvg.paragraphColor,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      );

//Modular Fields
  Widget inputFieldBooking(String placeholder, final _controller) {
    return (TextField(
      textAlign: TextAlign.left,
      keyboardType: TextInputType.number,
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
          hintStyle:
              TextStyle(color: UpdateAvg.inputTextColor, letterSpacing: 1)),
    ));
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
                            '${selectedCar.getSelectedCar()?.cmake} ${selectedCar.getSelectedCar()?.model}',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${selectedCar.getSelectedCar()?.carRegistrationNumber}',
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
                              'Update Average',
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
                            inputFieldBooking('KM', KM),
                            SizedBox(
                              height: 25,
                            ),
                            inputFieldBooking('Litres', L),
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
              child: addBookingButton('Update Average'),
            )
          ],
        ),
      ),
    );
  }
}

//Implements the top bar with the back button
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
                  MaterialPageRoute(builder: (context) => Dashboard()),
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
