import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class TransactionModel extends HiveObject{

  @HiveField(0)
  int? index;

  @HiveField(1)
  final String discription;

  @HiveField(2)
  final String type;

  @HiveField(3)
  final String amount;

  @HiveField(4)
  final String date;
  
  TransactionModel({required this.discription, required this.type, required this.amount, required this.date,this.index});
}