// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class Staff extends StatelessWidget {
  const Staff({super.key});

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
  Widget nameOfPerson() => Text(
        'Staff Member',
        style: TextStyle(
          color: Staff.paragraphColor,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      );
  Widget logOutBtn(String btnText) {
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

  // create a list of string
  static const List<String> list = [
    'Mark Attendance',
    'Request Leaves',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(22, 22, 26, 1),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 70, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: avatarOfPerson(),
                  ),
                  Flexible(
                    flex: 1,
                    child: nameOfPerson(),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 6,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Color.fromARGB(179, 236, 236, 236),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print(list[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 70,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: Color.fromRGBO(127, 92, 237, 1),
                              shape: SmoothRectangleBorder(
                                borderRadius: SmoothBorderRadius(
                                  cornerRadius: 12,
                                  cornerSmoothing: 1,
                                ),
                              ),
                            ),
                  
                            child: ListTile(
                              title: Text(
                                list[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: logOutBtn('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
