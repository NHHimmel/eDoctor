import 'package:e_doctor/util/category.dart';
import 'package:e_doctor/util/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../util/elements.dart';
import '../util/services.dart';
import 'package:e_doctor/storage/memory.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;
  List<DoctorInfo> doctors = [
    DoctorInfo(name: 'Sam', department: 'Psychiatrist', image: 'doctor_01.png', color: Colors.yellow[700]!),
    DoctorInfo(name: 'Yun Ji', department: 'Brain', image: 'doctor_02.png', color: Colors.pink[600]!),
    DoctorInfo(name: 'Stephen', department: 'Heart Surgeon', image: 'doctor_03.png', color: Colors.indigo[400]!)
  ];
  final ScrollController _scrollController = ScrollController();
  Memory db = Memory();

  @override
  void initState() {
    super.initState();

  }
  Widget searchBar(BuildContext context, SearchController controller){

    return SearchBar(
      controller: controller,
      hintText: 'Search',
      onTap: (){controller.openView();},
      onChanged: (_){controller.openView();},
      leading: Icon(Icons.search, color: isDark?Colors.white:Colors.black),
      trailing: <Widget>[
        Tooltip(
          message: 'change theme',
          child: IconButton(
            onPressed: (){
              setState(() {
                  isDark = !isDark;
              });
            },
            icon: Icon(isDark ? Icons.brightness_2_outlined:Icons.wb_sunny_outlined, color: isDark? Colors.white:Colors.black,),
          ),
        )
      ],
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: isDark?Colors.black45:Colors.white,
      // bottom navigation bar at footer
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: isDark?Colors.black:Colors.white,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/home.svg',width: 30,height: 30, colorFilter: ColorFilter.mode(Colors.blue[400]!, BlendMode.srcIn)), label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/pill.svg', width:30,height:30,colorFilter: ColorFilter.mode(Colors.blue[400]!, BlendMode.srcIn)), label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/book.svg', width:30,height:30,colorFilter: ColorFilter.mode(Colors.blue[400]!, BlendMode.srcIn)), label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/gear.svg',width: 30, height: 30, colorFilter: ColorFilter.mode(Colors.blue[400]!, BlendMode.srcIn)), label: ''),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(children: [
                  //profile pic
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/patient_01.jpg'), fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  Spacer(),
                  //menu icon button
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.lightBlue[800], size: 35,)),
                  //search bar

                ],),

              ),
              // Creating Search bar with SearchAnchor() widget
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SearchAnchor(
                    builder: (BuildContext context, SearchController controller){
                      return searchBar(context, controller);
                    },
                    suggestionsBuilder: (BuildContext context, SearchController controller){
                      return List<ListTile>.generate(5, (int index){
                        final string = "item $index";
                        return ListTile(
                          title: Text(string),
                          onTap: (){
                            setState(() {
                              controller.closeView(string);
                            });
                          },
                        );
                      });
                    }),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  itemCount: doctors.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i){
                      return Service(color: doctors[i].color, name: doctors[i].name!, department: doctors[i].department!, image: doctors[i].image!);
                    }
                )
              ),
              SizedBox(height: 13,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(alignment: Alignment.centerLeft,
                child: Text('Most Popular', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: isDark?Colors.white:Colors.black),)),
              ),
              SizedBox(height:13),
              SizedBox(
                height: 127,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                      Department(name: 'Pediatrics',color: Colors.red[400]!,svg:'pediatrics.svg'),
                      Department(color: Colors.indigo[600]!, name: 'Cardiology', svg: 'cardiology.svg'),
                      Department(color: Colors.orange, name: 'Dentistry', svg:'dentistry.svg')
                  ],
                ),
              )
            ]),
          ),
            ),
      ));
  }
}
