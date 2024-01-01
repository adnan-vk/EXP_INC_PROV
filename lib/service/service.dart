import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini/model/model.dart';

class DbService{
  Future getAllTransaction()async{
    final transactiondb = await Hive.openBox<TransactionModel>("transaction_db");
    return transactiondb.values.toList();
  }
 
  Future addTransaction(TransactionModel value)async{
    final transactiondb = await Hive.openBox<TransactionModel>("transaction_db");
    return transactiondb.add(value);
  }

  Future deleteTransaction (int index)async{ 
    final transactiondb = await Hive.openBox<TransactionModel>("transaction_db");
    await transactiondb.deleteAt(index);
  }

  Future updateTransaction(TransactionModel value , index)async{
    final transactiondb = await Hive.openBox<TransactionModel>("transaction_db");
    await transactiondb.putAt(index, value);
  }
}