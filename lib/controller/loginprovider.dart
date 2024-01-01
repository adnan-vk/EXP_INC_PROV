import 'package:flutter/material.dart';
import 'package:mini/main.dart';
import 'package:mini/widgets/bottombar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier{
final userController = TextEditingController();
final passwordController = TextEditingController();
bool dataMatched = true;

final formKey = GlobalKey<FormState>();

void checklogin(ctx)async{
  final username = userController.text;
  final password = passwordController.text;
  if(username == "ADNAN" && password == "123"){
     final srdprf=await SharedPreferences.getInstance();
     await srdprf.setBool(savekeyname, true);
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1)=> const Bottom())); 
  }else{
      dataMatched = false;
  }  
 }
}