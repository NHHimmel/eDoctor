import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Department extends StatelessWidget {
  final Color color;
  final String name;
  final String svg;

  Department({super.key,required this.color, required this.name, required this.svg});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            SvgPicture.asset(
              'assets/$svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 50,height: 50,
            ),
            SizedBox(height: 10,),
            Text(name, style: TextStyle(color: Colors.white),)
          ],),
        ),
      ),
    );
  }
}
