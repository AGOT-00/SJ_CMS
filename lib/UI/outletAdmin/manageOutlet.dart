// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:figma_squircle/figma_squircle.dart';
import '/outlet_admin.dart';

class ManageOutlet extends StatelessWidget {
  const ManageOutlet({super.key});
  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);
  static const String forMale = 'Mr.';
  static bool carsArePresent = false;
  static const Color addedCarBgColour = Color.fromRGBO(127, 92, 237, .27);
  static const Color addedCarBorderColour = Color.fromRGBO(127, 92, 237, 1);
  static const Color deleteIconBgColour = Color.fromRGBO(248, 113, 113, 1);

  Widget addedOutletDetail(String outletName, String outletAddress) {
    return Container(
      decoration: BoxDecoration(
        color: addedCarBgColour,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: addedCarBorderColour,
          width: 2,
        ),
      ),
      padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        outletName,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        outletAddress,
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
                  print('Delete');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 25 * 2,
                  height: 25 * 2,
                  decoration: BoxDecoration(
                    color: deleteIconBgColour,
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

  Widget addOutletBtn(String btnText) {
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
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 26, 1),
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: topBar(),
            ),
            Column(
              children: [
                Container(
                  // show 'Oulets :' text
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: outletHeading(
                    heading: 'Outlets :',
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                  child: Column(
                    children: [
                      addedOutletDetail('Outlet1', 'Johar Town'),
                      SizedBox(
                        height: 25,
                      ),
                      addedOutletDetail('Outlet2', 'Gulberg'),
                      SizedBox(
                        height: 25,
                      ),
                      addedOutletDetail('Outlet3', 'Model Town'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
          padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
          child: addOutletBtn('+ Add Outlet'),
        ),
      ]),
    );
  }
}

class outletHeading extends StatelessWidget {
  const outletHeading({
    Key? key,
    required this.heading,
  }) : super(key: key);

  final String heading;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          heading,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class topBar extends StatelessWidget {
  const topBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => OutletAdmin()),
                (route) => false);
          },
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
            size: 25,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .16,
        ),
        Text(
          'Manage Outlet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
