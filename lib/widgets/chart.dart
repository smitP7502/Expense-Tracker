import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../widgets/char_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransacion;

  Chart(this.recentTransacion);

  // get is the genarator which is used to genrate the dynamic values
  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      // subract function is return DateTime instance using substacting the
      //given days from today

      double sum = 0;

      for (var i = 0; i < recentTransacion.length; i++) {
        if (recentTransacion[i].date.day == weekDay.day &&
            recentTransacion[i].date.month == weekDay.month &&
            recentTransacion[i].date.year == weekDay.year) {
          sum += recentTransacion[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(sum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sum
      };
    });
  }

  double get totalSpending {
    return groupedTransaction.fold(0.0000000001, (sum, item) {
      double am = item['amount'] as double;
      return am + sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Card(
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransaction.map((tx) {
          String str = tx['day'] as String;
          double am = tx['amount'] as double;
          double percent = am / totalSpending;

          return Flexible(
              fit: FlexFit.tight, child: ChartBar(str, am, percent));
        }).toList(),
      ),
    );
  }
}
