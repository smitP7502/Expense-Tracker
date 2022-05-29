// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './widgets/user_transaction.dart'; // statefull widget

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // String? titleInput;
  // String? amountInput;
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expanse planner app",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expanse Planner"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              tooltip: "open the box",
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          // Use for the scrollable column or row
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.green,
                child: Container(
                  child: Text('Chart'),
                  width: double.infinity,
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
