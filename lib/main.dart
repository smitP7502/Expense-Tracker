import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors
              .red, // set the color of the floating action button if accentColors is not available then it use the primaryswatch color
          fontFamily: 'Title',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: "Rubik", fontSize: 25, fontWeight: FontWeight.w600),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   't1',
    //   'New Shoes',
    //   69.99,
    //   DateTime.now(),
    // ),
    // Transaction(
    //   't2',
    //   'Weekly Groceries',
    //   16.53,
    //   DateTime.now(),
    // ),
    // Transaction(
    //   't1',
    //   'New Shoes',
    //   69.99,
    //   DateTime.now(),
    // ),
    // Transaction(
    //   't2',
    //   'Weekly Groceries',
    //   16.53,
    //   DateTime.now(),
    // ),
  ];

  // return the list of transaction which is done in last 7 days
  List<Transaction> get _recentTransactinos {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      // Subract the Today's date from the 7 days and get the onther date if the
      //transaction date is after that date then it will return true and where
      //function adds into the list
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        DateTime.now().toString(), txTitle, txAmount, DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(_recentTransactinos);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactinos),
            _userTransactions.isEmpty
                ? Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "There is no Transactions",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "assets/images/empty.png",
                          // scale: 0.8,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  )
                : TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
