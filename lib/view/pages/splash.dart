import 'package:flutter/material.dart';
import 'package:mini/main.dart';
import 'package:mini/widgets/bottombar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    checkuserlogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/logo 2.png',height: height*0.3,)
            ],
          )
        ),
      ),
    );
  }
  Future <void> gotoLogin()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));
  }
  Future gotoHome()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Bottom()));
  }
  void checkuserlogin()async{
    final _sharedprf=await SharedPreferences.getInstance();
    final _userlogin=_sharedprf.getBool(savekeyname);
    if(_userlogin==null || _userlogin==false){
      gotoLogin();
    }else{
      gotoHome();
    }
  }
}