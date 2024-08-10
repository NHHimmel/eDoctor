import 'package:hive_flutter/hive_flutter.dart';


class Memory{
  final _myBox = Hive.box('mybox');

  List colorList = [];

  void loadData(){
    colorList = _myBox.get('COLOURS');
  }
  void updateData(){
    _myBox.put('COLOURS', colorList);
  }

}