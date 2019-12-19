import 'package:flutter/material.dart';
class AddTransactions extends StatelessWidget {
  final titleController=TextEditingController();
  final amountController=TextEditingController();
  final Function addTrans;

  AddTransactions(this.addTrans);
  @override
  Widget build(BuildContext context) {
    return  Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(hintText: 'Amount'),
            ),
            FlatButton(
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                addTrans(titleController.text,double.parse(amountController.text));
              },
            ),
          ],
        ),
      );
  }
}