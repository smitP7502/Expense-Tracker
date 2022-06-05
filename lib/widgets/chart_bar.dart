import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double amount;
  final double percnet;

  ChartBar(this.day, this.amount, this.percnet);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(
            child: Text(amount.toString()),
            fit: BoxFit.fill,
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                        color: Color.fromARGB(255, 86, 86, 86), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: 1 - percnet,
                  child: percnet == 0
                      ? Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 229, 229, 229),
                              border: Border.all(
                                  color: Color.fromARGB(255, 86, 86, 86),
                                  width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 229, 229, 229),
                            border: Border.all(
                                color: Color.fromARGB(255, 86, 86, 86),
                                width: 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(day)
        ],
      ),
    );
  }
}
