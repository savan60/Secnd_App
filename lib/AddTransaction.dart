import 'package:flutter/material.dart';

class AddTransactions extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTrans;

  AddTransactions(this.addTrans);

  void submitcode(){
    final enteredTitle=titleController.text;
    final enteredCounter=double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredCounter <=0){
      return;
    }
      addTrans(
        enteredTitle,
        enteredCounter,
      );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
            onSubmitted: (_)=>submitcode(),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_)=>submitcode(),
          ),
          FlatButton(
            child: Text(
              'Add transaction',
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: submitcode
            ,
          ),
        ],
      ),
    );
  }
}
