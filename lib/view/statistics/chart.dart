import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mini/controller/dbprovider.dart';
import 'package:mini/model/model.dart';
import 'package:provider/provider.dart';

class MyChart extends StatelessWidget {
  MyChart({super.key});

  final List<Color> sectionColors = [
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.red,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> trans = Provider.of<DbProvider>(context).transaction;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CHART"),
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
      ),
      body: SizedBox(
        height: 500,
        child: PieChart(
          PieChartData(
            sections: List.generate(
              trans.length,
              (index) {
                double cost = double.parse(trans[index].amount);
                double totalCost = calculateTotalCost(trans);
                double percentage = (cost / totalCost) * 100;
                final name = trans[index].discription;

                return PieChartSectionData(
                  badgePositionPercentageOffset: 1.1,
                  titlePositionPercentageOffset: .4,
                  color: sectionColors[index],
                  value: percentage,
                  title: ''' 
                    $name
                    (${percentage.toStringAsFixed(2)}%)
                    ₹ ${cost.toStringAsFixed(2)}
                  ''',
                  radius: 80,
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                );
              },
            ),
            sectionsSpace: 5,
            centerSpaceRadius: 90,
            startDegreeOffset: 0,
          ),
        ),
      ),
    );
  }
  double calculateTotalCost(List<TransactionModel> trans) {
  double totalCost = 0;
  for (var x in trans) {

    totalCost += double.parse(x.amount);
  }
  return totalCost;
}
}