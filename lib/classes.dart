
// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names, empty_constructor_bodies

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './UI/User/Login/login.dart';

//All Classes Follows SRP

//Patterns == Singleton, Factory, Adapter, Composite, Observer, Template, Abstract Factory

// //All Classes Follows LSK
// //All Classes Follows ISP
// //All Classes Follows Dependency_Inversion


//Pattern Used: Singleton
//Singleton Class for Logged in User
class loggedinUser {
  loggedinUser._privateConstructor();

  static final loggedinUser _instance = loggedinUser._privateConstructor();

  static loggedinUser get instance => _instance;

  static UserClass? _LoggedinUser;

  void setLoggedinUser(UserClass user) {
    _LoggedinUser = user;
  }

  UserClass? getLoggedinUser() {
    return _LoggedinUser;
  }

  // static Car? _SelectedCar;

  // void setSelectedCar(Car car) {
  //   _SelectedCar = car;
  // }

  // Car? getSelectedCar() {
  //   return _SelectedCar;
  // }

  void signout() {
    _LoggedinUser = null;
    //_SelectedCar = null;
  }

  factory loggedinUser() {
    return _instance;
  }
}

//Pattern Used: Singleton
//SOLID Principle Used.
class SelectedCar {
  static Car? _SelectedCar;

  SelectedCar._privateConstructor();

  static final SelectedCar _instance = SelectedCar._privateConstructor();

  void setSelectedCar(Car car) {
    _SelectedCar = car;
  }

  Car? getSelectedCar() {
    return _SelectedCar;
  }

  void signout() {
    _SelectedCar=null;
  }

  factory SelectedCar() {
    return _instance;
  }
}

//SOLID
//SRP
class UserClass {
  String? name;
  String? phone;
  String? cnic;
  bool? active;

  UserClass(
      {required this.name,
      required this.phone,
      this.active = false,
      this.cnic = ''});

  //Setter and Getter of UserClass
  String? get getName => name;
  String? get getPhone => phone;
  String? get getCnic => cnic;
  bool? get getActive => active;

  void setName(String name) {
    this.name = name;
  }

  void setPhone(String phone) {
    this.phone = phone;
  }

  void setCnic(String cnic) {
    this.cnic = cnic;
  }

  void setActive(bool active) {
    this.active = active;
  }

  Map<String, dynamic> toJson() =>
      {'phone': phone, 'name': name, 'cnic': cnic, 'active': active};

  static UserClass fromJson(Map<String, dynamic> Obj) => UserClass(
      name: Obj['name'],
      phone: Obj['phone'],
      cnic: Obj['cnic'],
      active: Obj['active']);
}


class Booking {
  String? CarRegistration;
  String? BookingDate;
  String? BookingTime;

  Booking(
      {required this.CarRegistration,
      required this.BookingDate,
      required this.BookingTime});

//Setter and Getter of Booking
  String? get getCarRegistration => CarRegistration;
  String? get getBookingDate => BookingDate;
  String? get getBookingTime => BookingTime;

  void setCarRegistration(String CarRegistration) {
    this.CarRegistration = CarRegistration;
  }

  void setBookingDate(String BookingDate) {
    this.BookingDate = BookingDate;
  }

  void setBookingTime(String BookingTime) {
    this.BookingTime = BookingTime;
  }

  Map<String, dynamic> toJson() => {
        'CarRegistration': CarRegistration,
        'BookingDate': BookingDate,
        'BookingTime': BookingTime,
      };

  static Booking fromJson(Map<String, dynamic> Obj) => Booking(
      CarRegistration: Obj['CarRegistration'],
      BookingDate: Obj['BookingDate'],
      BookingTime: Obj['BookingTime']);
}

//object Adapter Pattern
//Template Pattern
//ISP,LSP
class Json {  
  Json();
}


//SRP
//Design Pattern Used: Factory

class Database {
  Database() {}

  Future<UserClass?> readUserfromDatabase(String phone) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc(phone);
    final Userdata = await docUser.get();

    if (Userdata.exists) {
      UserClass Data = UserClass.fromJson(Userdata.data()!);
      return Data;
    }
    return null;
  }

  Future<Car?> readaCarfromDatabase(String phone, String Registration) async {
    final docUser = FirebaseFirestore.instance
        .collection('Users')
        .doc(phone)
        .collection('Car')
        .doc(Registration);
    final CarData = await docUser.get();

    if (CarData.exists) {
      Car CData = Car.fromJson(CarData.data()!);
      return CData;
    }
    return null;
  }

  Future<Map<String, Car>?> readListCarfromDatabase(String? phone) async {
    final docUser = FirebaseFirestore.instance
        .collection('Users')
        .doc(phone)
        .collection('Car');
    final CarData = await docUser.get();
    final Map<String, Car> Data = {};
    if (CarData.docs.isNotEmpty) {
      for (var i = 0; i < CarData.docs.length; i++) {
        Car Obj = Car.fromJson(CarData.docs[i].data());
        String? key = Obj.carRegistrationNumber;
        Data['$key'] = Obj;
      }
      return Data;
    }
    return null;
  }

  void saveUsertoDatabase(UserClass obj) async {
    final docUser =
        FirebaseFirestore.instance.collection('Users').doc(obj.phone);
    final json_obj = obj.toJson();
    await docUser.set(json_obj);
  }

  void SaveCartoDatabase(String phone, List<Car> obj) async {
    final docUser = FirebaseFirestore.instance
        .collection('Users')
        .doc(phone)
        .collection('Car');
    for (var i = 0; i < obj.length; i++) {
      final json_obj = obj[i].toJson();
      await docUser.doc(obj[i].carRegistrationNumber).set(json_obj);
    }
  }

  void SaveaCartoDatabase(String phone, Car obj) async {
    final docUser = FirebaseFirestore.instance
        .collection('Users')
        .doc(phone)
        .collection('Car');
    await docUser.doc(obj.carRegistrationNumber).set(obj.toJson());
  }

  void deleteCarfromDatabase(Car car) async {
    //Delete a car from the Firebase Database

    loggedinUser obj = loggedinUser();

    FirebaseFirestore.instance
        .collection('Users')
        .doc(obj.getLoggedinUser()!.phone)
        .collection('Car')
        .doc(car.carRegistrationNumber)
        .delete();
  }

  void savebookingtodb(Booking Obj) async {
    final docUser = FirebaseFirestore.instance
        .collection('Booking')
        .doc(Obj.CarRegistration);
    await docUser.set(Obj.toJson());
  }

  Future<Booking?> readabookingfromdb(String? Registration) async {
    final docUser =
        FirebaseFirestore.instance.collection('Booking').doc(Registration);
    final BookingData = await docUser.get();

    if (BookingData.exists) {
      Booking BData = Booking.fromJson(BookingData.data()!);
      return BData;
    }

    return null;
  }

  Future<Map<String, Booking>?> readbookingfromdb(
      String? carRegistrationNumber) async {
    final docUser = FirebaseFirestore.instance.collection('Booking');
    final BookingData = await docUser.get();
    final Map<String, Booking> Data = {};
    if (BookingData.docs.isNotEmpty) {
      for (var i = 0; i < BookingData.docs.length; i++) {
        Booking Obj = Booking.fromJson(BookingData.docs[i].data());
        String? key = Obj.CarRegistration;
        if (key == carRegistrationNumber) {
          Data['$key'] = Obj;
        }
      }
      return Data;
    }
    return null;
  }
}

//SRP,ISP ,OCP, LSP
//Design Pattern Used: 
class Car extends Json{
  //CReate a class for car
  String? carRegistrationNumber;
  String? cmake;
  String? model;
  String? color;
  String? mileage;

  Car(
      {required this.cmake,
      required this.carRegistrationNumber,
      required this.model,
      required this.color,
      required this.mileage});

  //Setter and Getter for Car
  String? getCarRegistrationNumber() {
    return carRegistrationNumber;
  }

  String? getCmake() {
    return cmake;
  }

  String? getModel() {
    return model;
  }

  String? getColor() {
    return color;
  }

  String? getMileage() {
    return mileage;
  }

  void setCarRegistrationNumber(String? carRegistrationNumber) {
    this.carRegistrationNumber = carRegistrationNumber;
  }

  void setCmake(String? cmake) {
    this.cmake = cmake;
  }

  void setModel(String? model) {
    this.model = model;
  }

  void setColor(String? color) {
    this.color = color;
  }

  void setMileage(String? mileage) {
    this.mileage = mileage;
  }

  Map<String, dynamic> toJson() => {
        'carRegistrationNumber': carRegistrationNumber,
        'cmake': cmake,
        'model': model,
        'color': color,
        'mileage': mileage
      };

  static Car fromJson(Map<String, dynamic> Obj) => Car(
      cmake: Obj['cmake'],
      carRegistrationNumber: Obj['carRegistrationNumber'],
      model: Obj['model'],
      color: Obj['color'],
      mileage: Obj['mileage']);
}



