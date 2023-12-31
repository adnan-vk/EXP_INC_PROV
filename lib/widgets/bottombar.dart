import 'package:flutter/material.dart';
import 'package:mini/controller/bottomprovider.dart';
import 'package:mini/view/pages/add.dart';
import 'package:mini/view/pages/hometab.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mini/view/settings/settings.dart';
import 'package:mini/view/statistics/chart.dart';
import 'package:provider/provider.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width; 
    final providerdata = Provider.of<BottomProvider>(context);
    return Scaffold(
      body: _tabs [providerdata.currentindex],
      bottomNavigationBar: 
      Container(
        width: size*1,
        color:  const Color.fromARGB(255, 3, 45, 79),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: GNav(
            onTabChange: (index){
                providerdata.change(index);
            },
            backgroundColor:  const Color.fromARGB(255, 3, 45, 79),
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.yellow,
            padding: const EdgeInsets.all(13),
            gap: 10,
            tabs: const [
            GButton(icon: Icons.home_outlined,text: "Home",),
            GButton(icon: Icons.insert_chart_outlined,text: "Chart",),
            GButton(icon: Icons.settings_outlined,text: "Settings",),
          ],),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 30,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Add()));
          },
          child: const Icon(Icons.add,color: Colors.black,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
final List _tabs = [
  const HomeTab(),
   MyChart(),
  const Settings(),
];