import 'package:flutter/material.dart';

class Elements extends StatelessWidget {
  final String amount;
  final String name;
  const Elements({super.key, required this.amount, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        // margin: EdgeInsets.all(10),
          width: 127,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,

        ),
        child: Column(mainAxisAlignment:MainAxisAlignment.center,
          children: [
          Text(amount,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
          Text(name,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500), textAlign: TextAlign.center,),

        ],),
      ),
    );
  }
}
