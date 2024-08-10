import 'package:e_doctor/util/elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    String name = data['name'];
    String department = data['department'];
    String image = data['image'];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.send))
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                SizedBox(width: 10,),
                Container(
                  height: 190 , width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/$image'),fit: BoxFit.cover,
                    )
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('Dr. $name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Specialist on $department', style: TextStyle(color: Colors.grey)),
                  
                    SizedBox(height: 20,),
                    Container(
                      child: Row(children: [
                       Image.asset('assets/credit-card.png',height: 30, width: 30,),
                        SizedBox(width: 10,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Text('COST', style: TextStyle(fontSize:12, color: Colors.grey ),),
                          Text('BDT 50/min', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),),
                        ],)
                      ],),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(children: [
                        Image.asset('assets/happiness.png',height: 30, width: 30,),
                        SizedBox(width: 10,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Text('HAPPY', style: TextStyle(fontSize:12, color: Colors.grey ),),
                          Text('500+ ratings', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),),
                        ],)
                      ],),
                    )
                  ],),
                )
              ],),
              Container(
                padding: EdgeInsets.fromLTRB(18,40,0,0),
                child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                  Text('Bio', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),),
                  SizedBox(height: 15,),
                  Text('MBBS (UK), MRCP(UK), Board Certified in Int. Medicine (U.S.A). The founder of Healthy Life Allergists Clinic.',
                  style: TextStyle(fontSize: 13),
                  ),
                ],),
              ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.fromLTRB(18, 20, 0, 0),
                child: Text('Services', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Elements(amount: "878+", name: "Patients",),
                      Elements(amount: "1k+",name: "Appoint...",),
                      Elements(amount: "5+", name: "Years of Experience")
                    ],
                  )
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text('History', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),),
              ),
              SizedBox(height: 20,),

              // appointment button
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Text('Book an appointment', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white),textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ],),
          ),
        ),
    );
  }
}
