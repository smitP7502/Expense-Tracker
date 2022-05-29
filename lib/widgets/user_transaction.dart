import 'package:flutter/material.dart';
import '../module/transaction.dart'; // this is the normal class
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  List<Transaction> _userTransaction = [
    Transaction("t1", "shoe", 11200, DateTime.now()),
    Transaction("t2", "mobile", 10000, DateTime.now()),
    Transaction("t3", "laptop", 50000, DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, int txAmount) {
    final newTx = Transaction(
        DateTime.now().toString(), txTitle, txAmount, DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
