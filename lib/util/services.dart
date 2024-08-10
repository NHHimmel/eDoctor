import 'package:flutter/material.dart';
import 'package:e_doctor/pages/doctor_profile.dart';

class Service extends StatelessWidget {
  String name;
  String department;
  Color color;
  String image;
  Service({super.key, required this.color, required this.name, required this.department, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Navigating to page...');
        Navigator.pushNamed(context, '/doctor_profile',arguments: {
            'name':name,
            'department':department,
            'image': image
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),

            //for shadow effects
            boxShadow: [
              BoxShadow(
                color: color,
                offset: Offset(0.0, 0.9),
                blurRadius: 3
              ),
            ],
          ),
          child: Row(children: [
             Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 5,),
                    Text(department, style: TextStyle(fontSize: 14, color: Colors.white) ,),
                  ],),
                ),
            Image.asset(
              'assets/$image',
              height: 120,
              width: 100,
              fit: BoxFit.cover,
            )
          ],),


        ),

      ),
    );
  }
}


