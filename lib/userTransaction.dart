import 'package:flutter/material.dart';
import './TransactionList.dart';
import './AddTransaction.dart';
import './transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'p1',
      title: 'Books',
      expense: 20,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'p2',
      title: 'Laptop',
      expense: 40,
      date: DateTime.now(),
    ),
  ];

  void _addTrsaction(String txtitle, num txamount) {
    final newTx = Transaction(
        title: txtitle,
        expense: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Text('trial'),
          AddTransactions(_addTrsaction),
          TransactionList(_transactions),
      ],
    );
  }
}