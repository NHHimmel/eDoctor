import 'package:e_doctor/pages/doctor_profile.dart';
import 'package:e_doctor/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main() async{
  //initialize hive
  await Hive.initFlutter();
  // open the box
  var box = await Hive.openBox('mybox');


  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/doctor_profile': (context)=>DoctorProfile(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
