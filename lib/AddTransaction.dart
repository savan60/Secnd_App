import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactions extends StatefulWidget {
  final Function addTrans;

  AddTransactions(this.addTrans);

  @override
  _AddTransactionsState createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _choosenDate;

  void submitcode() {
    if(amountController.text.isEmpty){
      return ;
    }
    final enteredTitle = titleController.text;
    final enteredCounter = double.parse(amountController.text);
    final date=_choosenDate;

    if (enteredTitle.isEmpty || enteredCounter <= 0 || date == null) {
      return;
    }
    widget.addTrans(
      enteredTitle,
      enteredCounter,
      date,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicked() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((onValue) {
      if (onValue == null) {
        return;
      }
      setState(() {
        _choosenDate = onValue;
      });
    });
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
            onSubmitted: (_) => submitcode(),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitcode(),
          ),
          Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(_choosenDate == null
                      ? 'No Date Choosen'
                      : 'Picked Date : ${DateFormat.yMd().format(_choosenDate)}'),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _presentDatePicked,
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text(
              'Add transaction',
            ),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            onPressed: submitcode,
          ),
        ],
      ),
    );
  }
}
