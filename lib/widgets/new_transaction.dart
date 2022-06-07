// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../classes/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final enteredTitle = TextEditingController();
  final enteredAmount = TextEditingController();
  var _selectedDate;

  void SubmitData() {
    if (enteredAmount.text.isEmpty) {
      return;
    }
    String title = enteredTitle.text.toString();
    double amount = double.parse(enteredAmount.text);

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _PickDate() {
    DateTime pick;
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pick) {
      if (pick == null) {
        return;
      }
      setState(() {
        _selectedDate = pick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Tilte',
              ),
              controller: enteredTitle,
              onSubmitted: (_) => SubmitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: enteredAmount,
              onSubmitted: (_) => SubmitData(),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
                onPressed: () => SubmitData(), child: Text('Add Transaction')),
            Row(
              children: [
                Expanded(
                    child: _selectedDate == null
                        ? Text('No date Choosen!!')
                        : Text(DateFormat.yMd().format(_selectedDate))),
                TextButton(
                  onPressed: () => _PickDate(),
                  child: Text('Chosse Date'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
