import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../classes/transaction.dart';

class TransactionDisplay extends StatelessWidget {
  final List<Transaction> _transactionList;
  final Function _Delete;

  TransactionDisplay(this._transactionList, this._Delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _transactionList.isEmpty
          ? Column(
              children: [
                Text('No Transaction Yet!'),
                SizedBox(
                  height: 10,
                ),
                FittedBox(
                    child: Image.asset('assets/image/empty.png'),
                    fit: BoxFit.fill),
              ],
            )
          : ListView.builder(
              itemCount: _transactionList.length,
              itemBuilder: (BuildContext, index) {
                return Card(
                  elevation: 15,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 21),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        child: FittedBox(
                          child:
                              Text(_transactionList[index].amount.toString()),
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(_transactionList[index].title),
                      subtitle: Text(
                        DateFormat.yMMMd().format(_transactionList[index].date),
                      ),
                      trailing: IconButton(
                          onPressed: () => _Delete(_transactionList[index].id),
                          icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              }),
    );
  }
}
