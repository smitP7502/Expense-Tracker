import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submit() {
    final String etitle = titleController.text;
    final int eamount = int.parse(amountController.text);

    if (etitle.isEmpty || eamount <= 0) {
      return;
    }
    addTx(etitle, eamount);
  }

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submit(),
              // here the '_' is the not necessary for the function but, we can't use it so pass underscore
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            FlatButton(
                onPressed: submit,
                child: Text("Add Transaction"),
                textColor: Color.fromARGB(255, 158, 54, 176))
          ],
        ),
      ),
    );
  }
}
