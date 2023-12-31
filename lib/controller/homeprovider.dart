import 'package:flutter/material.dart';
import 'package:mini/controller/dbprovider.dart';
import 'package:mini/model/model.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier{
String search = "";
  List<TransactionModel> searchList = [];

  void searchResult(BuildContext context, String value) {
    var transactions = Provider.of<DbProvider>(context,listen:false).transaction;

    searchList = transactions
        .where((transaction) =>
            transaction.discription.toLowerCase().contains(value.toLowerCase()))
        .toList();

    notifyListeners();
  }
  
double bal(BuildContext context) {
    double currentbalance = 0.0;
    double income = 0.0;
    double expence = 0.0;

    var transactionList = Provider.of<DbProvider>(context).transaction;

    for (var x in transactionList) {
      if (x.type == "INCOME") {
        income += double.parse(x.amount);
      } else if (x.type == "EXPENSE") {
        expence += double.parse(x.amount);
      }
    }
    currentbalance = income - expence;
    return currentbalance;
  }

delete(int index, BuildContext context){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Column(
          children: [
            Text("DELETE"),
            Text("ARE U SURE WANT TO DELETE THIS TRANSACTION",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),textAlign: TextAlign.center,),
          ],
        ),
        actions: [
          ElevatedButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 3, 45, 79)),),
                  onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("CANCEL",)),
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 3, 45, 79))),
                  onPressed: (){
                 Provider.of<DbProvider>(context,listen: false).deleteTransaction(index);
                  Navigator.pop(context);

                }, child: const Text("DELETE",)),
        ],
      );
    },);
  }
}