// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:prectise/widgets/chart.dart';

import './classes/transaction.dart';
import './widgets/transaction_display.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          titleTextStyle: TextStyle(
            fontFamily: 'Fjall',
            // fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        listTileTheme: ListTileThemeData(),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List of the transactions
  final List<Transaction> _transactionList = [
    Transaction("New Shoe", 300, DateTime.now().toString(), DateTime.now()),
    Transaction("Grocery", 150, DateTime.now().toString(), DateTime.now()),
    Transaction("New Shoe", 300, DateTime.now().toString(), DateTime.now()),
    Transaction("Grocery", 150, DateTime.now().toString(), DateTime.now()),
    Transaction("New Shoe", 300, DateTime.now().toString(), DateTime.now()),
    Transaction("Grocery", 150, DateTime.now().toString(), DateTime.now()),
    Transaction("New Shoe", 300, DateTime.now().toString(), DateTime.now()),
    Transaction("Grocery", 150, DateTime.now().toString(), DateTime.now()),
    Transaction("New Shoe", 300, DateTime.now().toString(), DateTime.now()),
    Transaction("Grocery", 150, DateTime.now().toString(), DateTime.now()),
    Transaction("New Shoe", 300, DateTime.now().toString(), DateTime.now()),
    Transaction("Grocery", 150, DateTime.now().toString(), DateTime.now()),
  ];

  void _addTransaction(String title, double amount, DateTime dateT) {
    final newTra = Transaction(title, amount, dateT.toString(), dateT);

    setState(() {
      _transactionList.add(newTra);
    });
  }

  void _showInputWidget(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  void _removeTra(String id) {
    setState(() {
      _transactionList.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanse Planner"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_transactionList),
            TransactionDisplay(_transactionList, _removeTra),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInputWidget(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
