import 'package:flutter/material.dart';

class EditProvider extends ChangeNotifier{
TextEditingController decr = TextEditingController();
TextEditingController type = TextEditingController();
TextEditingController amt = TextEditingController();
TextEditingController date = TextEditingController();

  String dropdownvalue = "INCOME";
  void editprvd (newvalue){
    dropdownvalue = newvalue;
    notifyListeners();
  }
}