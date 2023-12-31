import 'package:flutter/material.dart';
import 'package:mini/main.dart';
import 'package:mini/widgets/bottombar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier{
final userController = TextEditingController();
final passwordController = TextEditingController();
bool dataMatched = true;

final formKey = GlobalKey<FormState>();

void checklogin(BuildContext ctx)async{ 
  // final provider = Provider.of<LoginProvider>(context, listen: false);
  final _username = userController.text;
  final _password = passwordController.text;
  if(_username == "ADNAN" && _password == "123"){
     final _srdprf=await SharedPreferences.getInstance();
     await _srdprf.setBool(savekeyname, true);
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1)=> const Bottom())); 
  }else{
      dataMatched = false;
  }  
 }
}