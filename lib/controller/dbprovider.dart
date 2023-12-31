import 'package:flutter/material.dart';
import 'package:mini/model/model.dart';
import 'package:mini/service/service.dart';

class DbProvider extends ChangeNotifier{
  List<TransactionModel> transaction = [];
  DbService dbservice = DbService();

  Future getAllTransactions()async{
    transaction = await dbservice.getAllTransaction();
    notifyListeners();
  }

  Future addTransaction(TransactionModel value)async{
    await dbservice.addTransaction(value);
    getAllTransactions();
  }

  Future deleteTransaction (int index)async{
    await dbservice.deleteTransaction(index);
    getAllTransactions();
  }

  Future updateTransaction(TransactionModel value, index)async{
    await dbservice.updateTransaction(value, index);
    getAllTransactions();
  }
}