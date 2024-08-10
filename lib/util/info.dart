import 'package:flutter/cupertino.dart';

class DoctorInfo {
  String bio = '';
  int rating = 0;
  int cost = 0;
  String? name;
  String? department;
  String? image;
  Color color;
  DoctorInfo(
      {required this.name, required this.department, required this.image, required this.color});

  void setBio(String biography){
    bio = biography;
  }
  void setCost(int amount){
    cost = amount;
  }

}
