import 'package:flutter/material.dart';
import 'package:mini/controller/loginprovider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
        centerTitle: true,
        title: const Text("Login Page"),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: height*0.4,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 70
                ),
                child: Image.asset('assets/logo 2.png'),
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height*0.6,
              width: width * 1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 3, 45, 79),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Consumer<LoginProvider>(
                      builder: (context, value, child) => 
                      Form(
                        key: value.formKey,
                        child: Column(
                          children: [
                            const Text('LOGIN',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,
                            color: Colors.yellow)),
                            const SizedBox(height: 30,),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: value.userController,
                              decoration: InputDecoration(
                                 errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                 borderSide: const BorderSide(color: Colors.red)
                                ),
                                 focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                 borderSide: const BorderSide(color: Colors.red)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(color: Colors.white)
                                ),
                                labelText: "User id",labelStyle: const TextStyle(color: Colors.white)
                              ),
                              validator: (value) {
                              if(value == null || value.isEmpty){
                              return "value is  empty";
                              }else{
                              return null;
                              }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: value.passwordController,
                              decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                 borderSide: const BorderSide(color: Colors.red)
                                ),
                                 focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                 borderSide: const BorderSide(color: Colors.red)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(color: Colors.white)
                                ),
                                labelText: "Password",labelStyle: const TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                              if(value == null || value.isEmpty){
                              return "value is  empty";
                              }else{
                              return null;
                              }
                              },
                            ),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.white),
                                side: MaterialStatePropertyAll(BorderSide(width: 5,color: Colors.yellow))
                              ),
                              onPressed: (){
                                if(value.formKey.currentState!.validate()){
                                 value.checklogin(context);
                                }else{
                                  print("data is empty");
                                }
                              }, 
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                vertical: width*0.05,
                                horizontal: height*0.03
                              ),
                              child: const Text('LOGIN',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  } 
}
