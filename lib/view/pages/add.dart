import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mini/controller/addprovider.dart';
import 'package:provider/provider.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
        centerTitle: true,
        title: const Text("ADD TRANSACTION"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: height * 1.1,
          color: Colors.grey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: 
                Image.asset('assets/logo 2.png',width: width*0.5,height: height*0.11,),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,right: 15,
                  bottom: 150
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Consumer<AddProvider>(
                    builder: (context, value, child) => 
                    Form(
                      key: value.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "the value is empty";
                              }else{
                                return null;
                              }
                            },
                            controller: value.decr,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "DISCRIPTION"
                            ),
                          ),
                          const SizedBox(height: 10,),
                          DropdownButtonFormField <String>(
                            decoration: InputDecoration(
                              hintText: "Select Item",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                            ),
                            dropdownColor: const Color.fromARGB(255, 208, 203, 203),
                            borderRadius: BorderRadius.circular(30),
                            isExpanded: true,
                            onChanged: (String? newvalue) {
                                value.dropdownvalue = newvalue.toString();
                                value.type.text = value.dropdownvalue;
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "INCOME",
                                child:Text("INCOME",style: TextStyle(
                                  color: Colors.green
                                ),)),
                              DropdownMenuItem(
                                value: "EXPENSE",
                                child:Text("EXPENSE",style: TextStyle(color: Colors.red),)),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "the value is empty";
                              }else{
                                return null;
                              }
                            },
                            controller: value.amt,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "ENTER THE AMOUNT",
                            ),
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "the value is empty";
                              }else{
                                return null;
                              }
                            },
                            readOnly: true,
                            controller: value.date,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "DATE",
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                            onTap: () async{ 
                              DateTime? pickdate =await showDatePicker(
                                context: context, 
                                initialDate: DateTime.now(), 
                                firstDate: DateTime(2000), lastDate: DateTime(2100));
                                if(pickdate != null){
                                    value.date.text = DateFormat.yMd().format(pickdate);
                                }
                            },
                          ),
                           const SizedBox(height: 10,),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                              side: MaterialStatePropertyAll(BorderSide(width: 2,color: Color.fromARGB(255, 3, 45, 79)))
                              ),
                            onPressed: (){
                            if(value.formKey.currentState!.validate()){
                              Provider.of<AddProvider>(context,listen: false).onSaveButtonClicked(context);
                             }
                            },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                              horizontal: height*0.03,
                              vertical: width*0.03,
                            ),
                            child: const Text("SAVE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}