import 'package:hive_flutter/hive_flutter.dart';

class Items {
  List<Items> itemsList = [];
  String label;
  bool isFinished;
  Items(this.label, this.isFinished);

  //reference the box
  final _myBox = Hive.box('mybox');

  //do this on first launch
  void createInitialData() {
    itemsList = [
      Items('Create First Task', false),
      Items('Done', false),
    ];
  }

  //load data from database
  void loadData() {
    itemsList = _myBox.get('TODOLIST');
  }

  //update database
  void updateDatabase() {
    _myBox.put('TODOLIST', itemsList);
  }
}
