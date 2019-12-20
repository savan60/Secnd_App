import 'package:flutter/material.dart';
import 'package:secnd_app/chart_block.dart';
import 'package:secnd_app/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> currentTransaction;

  Chart(this.currentTransaction);

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0.0;
      for (int i = 0; i < currentTransaction.length; i++) {
        if (currentTransaction[i].date.day == weekDay.day &&
            currentTransaction[i].date.month == weekDay.month &&
            currentTransaction[i].date.year == weekDay.year) {
          totalsum += currentTransaction[i].expense;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0,1),
        'amount': totalsum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValue.fold(0.0, (sum, item) {
      return sum = sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValue.map((data) {
            return Flexible(
                  fit: FlexFit.tight,
                          child: ChartBlock(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
