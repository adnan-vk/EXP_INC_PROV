import 'package:flutter/material.dart';

class EditProvider extends ChangeNotifier{
  String dropdownvalue = "INCOME";
  void editprvd (newvalue){
    dropdownvalue = newvalue;
    notifyListeners();
  }
}