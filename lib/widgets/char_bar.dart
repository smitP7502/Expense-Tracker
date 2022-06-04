import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spending;
  final double spendingPercent;

// Here we are creating the chart which is containing the bar and all the bar
// represent the last 7 days spendings
  ChartBar(this.lable, this.spending, this.spendingPercent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fitted box is keep the text in it's area, do not overlap with others
        FittedBox(child: Text(spending.toStringAsFixed(0))),
        Container(
          height: 100,
          width: 10,

          // stack widget is used for the overlape the widgets each above
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromARGB(255, 231, 231, 231),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // FractionallySizedBox is making the container which is depend
              // on other container's fraction values
              FractionallySizedBox(
                heightFactor: spendingPercent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      // for making chart perfect you should maintain same borderRadius
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
        Text(lable),
      ],
    );
  }
}
