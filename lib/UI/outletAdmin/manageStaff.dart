// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_local_variable, file_names, non_constant_identifier_names

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../outlet_admin.dart';

class ManageStaff extends StatefulWidget {
  const ManageStaff({super.key});

  static const Color paragraphColor = Color.fromRGBO(148, 161, 178, 1);
  static const Color inputTextColor = Color.fromRGBO(22, 22, 26, 1);
  static const Color btnColor = Color.fromRGBO(127, 90, 240, 1);
  static const String forMale = 'Mr.';
  static bool carsArePresent = false;
  static const Color addedCarBgColour = Color.fromRGBO(127, 92, 237, .27);
  static const Color addedCarBorderColour = Color.fromRGBO(127, 92, 237, 1);
  static const Color deleteIconBgColour = Color.fromRGBO(248, 113, 113, 1);

  @override
  State<ManageStaff> createState() => _ManageStaffState();
}

class _ManageStaffState extends State<ManageStaff> {
  Widget addedEmployeeDetail(String empName, String shift) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: ManageStaff.addedCarBgColour,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ManageStaff.addedCarBorderColour,
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
                        empName,
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
                        shift,
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
                    color: ManageStaff.deleteIconBgColour,
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
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.fromLTRB(40, 20, 40, 20)),
          backgroundColor:
              const MaterialStatePropertyAll<Color>(ManageStaff.btnColor),
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

  final workshopManagers = <String, String>{
    'John Doe': 'Morning',
    'Ali Hamza': 'Evening',
    'Ahmed Ali': 'Morning',
    'Ali Ahmed': 'Evening',
  };

  final floorManage = <String, String>{
    'John Doe': 'Morning',
    'Ali Hamza': 'Evening',
    'Ahmed Ali': 'Morning',
    'Ali Ahmed': 'Evening',
  };

  final inventoryManager = <String, String>{
    'John Doe': 'Morning',
    'Ali Hamza': 'Evening',
    'Ahmed Ali': 'Morning',
    'Ali Ahmed': 'Evening',
  };

  final staff = <String, String>{
    'John Doe': 'Morning',
    'Ali Hamza': 'Evening',
    'Ahmed Ali': 'Morning',
    'Ali Ahmed': 'Evening',
  };

  Widget AllEmployees(String tileTitle, Map<String, String> employees) {
    return ExpansionTile(
      title: Text(
        tileTitle,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const FaIcon(
        FontAwesomeIcons.chevronDown,
        color: Colors.white,
        size: 25,
      ),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              for (var employee in employees.entries)
                addedEmployeeDetail(employee.key, employee.value),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    bool stateChanged = false;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 22, 26, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                  child: const TopBar(),
                ),
                AllEmployees('Workshop Managers', workshopManagers),
                SizedBox(
                  height: 20,
                ),
                AllEmployees('Floor Managers', floorManage),
                SizedBox(
                  height: 20,
                ),
                AllEmployees('Inventory Managers', inventoryManager),
                SizedBox(
                  height: 20,
                ),
                AllEmployees('Staff', staff),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
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
          child: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
            size: 25,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .16,
        ),
        // ignore: prefer_const_constructors
        Text(
          'Manage Staff',
          // ignore: prefer_const_constructors
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
