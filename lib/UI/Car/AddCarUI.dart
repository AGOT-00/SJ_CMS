// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, prefer_const_constructors, duplicate_ignore, unnecessary_string_escapes, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import '/functions.dart';
import 'allCars.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/classes.dart';

class AddCarUI extends StatefulWidget {
  const AddCarUI({super.key});

  @override
  State<AddCarUI> createState() => _AddCarUIState();
}

class _AddCarUIState extends State<AddCarUI> {
  loggedinUser LoggedIn = loggedinUser();
  //Controllers
  static final CarMake = TextEditingController();
  static final CRegNumber = TextEditingController();
  static final CModel = TextEditingController();
  static final CarColor = TextEditingController();
  static final Km = TextEditingController();
  static final L = TextEditingController();

  //Implementing the Add Car UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(22, 22, 26, 1),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Add Car + Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [topBar()],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 330,
                  height: 50,
                  child: const Text(
                    'ADD CAR',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
                SizedBox(
                    width: 330,
                    child: inputField(
                        placeholder: 'Car Make',
                        ifcontroller: CarMake,
                        type: TextInputType.text,
                        iconobj: Icons.password)),
                spaceyaxis(),
                spaceyaxis(),
                SizedBox(
                    width: 330,
                    child: inputField(
                        placeholder: 'Car Model',
                        ifcontroller: CModel,
                        type: TextInputType.text,
                        iconobj: Icons.password)),
                spaceyaxis(),
                spaceyaxis(),
                SizedBox(
                    width: 330,
                    child: inputField(
                        placeholder: 'Registration Number',
                        ifcontroller: CRegNumber,
                        type: TextInputType.text,
                        iconobj: Icons.password)),
                spaceyaxis(),
                spaceyaxis(),
                SizedBox(
                    width: 330,
                    child: inputField(
                        placeholder: 'Car Color',
                        ifcontroller: CarColor,
                        type: TextInputType.text,
                        iconobj: Icons.password)),
                spaceyaxis(),
                spaceyaxis(),
                SizedBox(
                    width: 330,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 160,
                            child: inputField(
                                placeholder: 'KM',
                                ifcontroller: Km,
                                type: TextInputType.number,
                                iconobj: Icons.password)),
                        spaceyaxis(),
                        spaceyaxis(),
                        SizedBox(
                            width: 160,
                            child: inputField(
                                placeholder: 'L',
                                ifcontroller: L,
                                type: TextInputType.number,
                                iconobj: Icons.password)),
                        spaceyaxis(),
                      ],
                    )),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: InkWell(
                        onTap: (() {
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (context) => const SignUp()));
                        }), //_navigatetosignup()),
                        child: Row(
                          children: [
                            Icon(Icons.info, color: Colors.grey),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: const Text(
                                'By Adding Car, You Agree to our Terms and Conditions',
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 330,
                  child: button('Add Car', () {
                    addtodb();
                  }),
                ),
                // SizedBox(
                //   child: ElevatedButton(
                //       onPressed: () {
                //         print('hello world');
                //       },
                //       // ignore: sort_child_properties_last, prefer_const_constructors
                //       child: Text(
                //         'Add Car',
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //       style: ButtonStyle(
                //         padding: MaterialStatePropertyAll<EdgeInsets>(
                //             EdgeInsets.fromLTRB(40, 20, 40, 20)),
                //         backgroundColor:
                //             MaterialStatePropertyAll<Color>(btnColor),
                //         shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                //           RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(12),
                //           ),
                //         ),
                //       )),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Save Car to Database
  void addtodb() async {
    int mileagex = int.parse(Km.text) ~/ int.parse(L.text);
    Car car = Car(
        cmake: CarMake.text,
        carRegistrationNumber: CRegNumber.text,
        model: CModel.text,
        color: CarColor.text,
        mileage: mileagex.toString());

    print(
        '\nMake : ${car.cmake}\nModel : ${car.model}\nReg-Number : ${CRegNumber.text}\n');
    print('\Color : ${CarColor.text}\nKM : ${Km.text}\nL : ${L.text}\n');
    print('\n Object Updated. \n');
    showSnackBar(context, 'Car Added Successfully');
    Database db = Database();
    db.SaveaCartoDatabase(LoggedIn.getLoggedinUser()!.phone!, car);
  }

}

//Implementing the Top Bar with Back Button
class topBar extends StatelessWidget {
  const topBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .09),
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
          SizedBox(
            width: MediaQuery.of(context).size.width * .16,
          ),
        ],
      ),
    );
  }
}
