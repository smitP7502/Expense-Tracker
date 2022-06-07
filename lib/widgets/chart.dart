import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../classes/transaction.dart';
import '../widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransaction;

  Chart(this._recentTransaction);

  List<Map<String, Object>> get _groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;

      for (var i = 0; i < _recentTransaction.length; i++) {
        if (weekDay.day == _recentTransaction[i].date.day &&
            weekDay.month == _recentTransaction[i].date.month &&
            weekDay.year == _recentTransaction[i].date.year) {
          totalSum += _recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get TotalAmount {
    return _groupedTransaction.fold(0, (sum, ele) {
      double am = ele['amount'] as double;
      return sum + am;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_groupedTransaction);
    print(TotalAmount);
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedTransaction.map((gt) {
            String title = gt['day'] as String;
            double am = gt['amount'] as double;
            double percent = (TotalAmount == 0 ? 0 : am / TotalAmount);
            return ChartBar(title, am, percent);
          }).toList(),
        ),
      ),
    );
  }
}
