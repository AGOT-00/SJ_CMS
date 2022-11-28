// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_this, avoid_print, empty_constructor_bodies, annotate_overrides, camel_case_types, no_leading_underscores_for_local_identifiers, overridden_fields

import 'dart:ffi';
// Path: L202177_L202082_L201149_L201216_ClassModel.dart
class Vehicle{
  String? LicensePlate;
  String? make;
  String? brand;
  String? model;
  double? mileage;

  Vehicle({this.make,this.brand,this.model,this.mileage,this.LicensePlate}){
    mileage=0;
  }

  double update_mileage(double newMilage){
    this.mileage = mileage!+newMilage;
    this.mileage = (this.mileage!/2);
    return this.mileage!;
  }
}

class OTP{
  void sendOTP(String mobileNumber){
    print("OTP sent to $mobileNumber");
  }
}

class Person {
  String? name;
  String? phoneNum;
  String? CNIC;
  String? Per_Email;
  String? Password;
  
  Person(this.CNIC,this.name,this.Per_Email,this.phoneNum){}

  void purchase_parking_ticket(int time, int price){}

  bool verify(String email, String password){
    return email==Per_Email && Password==password;
  }
}

class Cuser extends Person{
  int? customerID;
  int? points;
  int? balance;
  List<Vehicle> list=[];

  Cuser(super.CNIC, super.name, super.Per_Email, super.phoneNum);
  
  void add_vehicle(Vehicle vehicle){
    list.add(vehicle);
  }

  void remove_vehicle(Vehicle vehicle){
    //list.add(vehicle);
  }

  bool VerifyUser(String Email, String Passowrd){
    return super.verify(Email, Passowrd);
  }

  double enter_details(double mileage,String LicensePlate){
    for(int i=0;i<list.length;i++){
      if(list[i].LicensePlate==LicensePlate){
        return list[i].update_mileage(mileage);
      }
    }
    return 0;
  }

  int book_appointment(int time, Cuser _customerDetails){return 0;}

  void cancel_appointment(int appointementID){}

  void payment(Payment p){}
}

//we will call this for any payment by Cuser
abstract class Payment{
  void payment();
}

class Paymentcard extends Payment{//we will override payment()}
  void payment(){}
}

class checkout_payment{
  checkout_payment(Payment p){
    p.payment();
  }
}

class Parts{
  String? name;
  String? type;
  Float? price;
  String? durability;
  double? rating;

  Parts(this.name,this.type,this.price,this.durability,this.rating){}
  void view_prices(){}
  void view_durability(){}
  void view_rating(){}
}

class Jobs{
  late List<Parts> PartsUsed;
  int? jobID;
  int? job_time;
  int? job_cost;

  Jobs(this.PartsUsed,this.jobID,this.job_time,this.job_cost){}
  void view_job_time(){}
}

class Outlet{
  String? branch;
  String? address;
  String? shifts;
  String? timings;
  double? rating;

  Outlet(this.branch,this.address,this.shifts,this.timings,this.rating){}

}

class Appointment{
  int? appointmentID;
  String? time_stamp;
  int? avg_time;
  int? calculated_cost;
  int? timeIN;
  int? timeOUT;
  late List<Parts> PartsUsed;

  Appointment(this.appointmentID,this.time_stamp,this.avg_time,this.calculated_cost,this.timeIN,this.timeOUT,this.PartsUsed){}
  void view_job_time(){}
  void view_job_status(){}
  void view_price(){}
  int Approve_appointment(int time, Cuser _customerDetails){return 0;}
  bool Cancel_appointment(int appointmentID){return true;}

}

class employee extends Person{
  int? empID;
  int? work_hours;
  String? workshift;
  int? fixed_salary;
  int? overworkhors;

  employee(String CNIC,String  name,String  Per_Email,String  DOB,String  phoneNum,String  Address,this.empID,this.work_hours,this.workshift,this.fixed_salary,this.overworkhors) : super(CNIC, name, Per_Email,  phoneNum){}
}

class Staff extends employee{
  int? staffID;
  String? staff_type;
  String? designation;
  String? status;

  Staff(String CNIC,String  name,String  Per_Email,String  DOB,String  phoneNum,String  Address, int empID,int work_hours,String workshift,int fixed_salary,int overworkhors,this.staffID,this.staff_type,this.designation,this.status) : super( CNIC,  name,  Per_Email,  DOB,  phoneNum,  Address,  empID, work_hours,workshift,fixed_salary,overworkhors){}
  void mark_attendance(int _staffID){}
  bool request_leaves(int _staffID){return true;}
}

class staff_attendance extends Staff{
  bool? attendance_status;

  staff_attendance(this.attendance_status) : super('', '', '', '', '', '', 0, 0, '', 0, 0, 0, '', '', ''){}
  void mark_attendance(int _staffID){}
  bool check_in(int _staffID){return true;}
  bool check_out(int _staffID){return true;}
  bool request_leaves(int _staffID){return true;}
}

class Manager extends employee{
  int? outletID;
  String? location;

  Manager(String CNIC,String  name,String  Per_Email,String  DOB,String  phoneNum,String  Address, int empID,int work_hours,String workshift,int fixed_salary,int overworkhors,this.outletID,this.location) : super( CNIC,  name,  Per_Email,  DOB,  phoneNum,  Address,  empID, work_hours,workshift,fixed_salary,overworkhors){}
}

class Inventory{}
//allocateinventory class will be used to allocate inventory by inventory manager
class AllocateInventory extends Inventory{}
//this class will be used by inventory manager to change invetory levels
class changeinventorylevels extends Inventory{}

class InventoryManager extends Manager{
  int? overworkhors;
  int? outletID;

  InventoryManager(this.overworkhors,this.outletID) : super('', '', '', '', '', '', 0, 0, '', 0, 0, 0, ''){}
  void allocate_inventory(){}
  bool change_inventory_levels(){return true;}
}

abstract class manage_staff{
//we can write a function here so we can call it in and override it in outletadmin where we have manage_employees and in floormanager where we have manage_staff
}

class OutletAdmin extends Manager{
  int? overworkhors;
  int? outletID;

  OutletAdmin(this.overworkhors,this.outletID) : super('', '', '', '', '', '', 0, 0, '', 0, 0, 0, ''){}
  void manage_outlets(int _outletID){}
  void manage_employees(int _empID){}
  void transfer_Cusers(int _customerID){}
  void manage_Cuser_accounts(int _customerID){}
  bool add_Parts_in_inventory(int partID){return true;}
}

class WorkshopManager extends Manager{
  int? salary;

  WorkshopManager(this.salary) : super('', '', '', '', '', '', 0, 0, '', 0, 0, 0, ''){}
  void maintainance_schedule(){}
  void work_shifts(){}
  bool leaves(int staffID){return true;}
  void view_job_loads(int outletID){}
  void view_performance_report(int outletID){}
  void view_inventory_levels(int outletID){}
  void view_Parts(int outletID){}
}

class FloorManager extends Manager{
  int? outletID;
  int? salary;

  FloorManager(this.outletID,this.salary) : super('', '', '', '', '', '', 0, 0, '', 0, 0, 0, ''){}
  void manage_jobs(int jobID){}
  void manage_staff(int staffID){}
  void run_reports(){}
  void return_items(){}
}