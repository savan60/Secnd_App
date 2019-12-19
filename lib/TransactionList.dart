import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (ctx,index){
          return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${transactions[index].expense.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length,
        ),
      
      );
  }
}

//  return Container(
//         height: 300,
//         child: Column(
//           children: transactions.map((tx) {
//             return Card(
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 15,
//                     ),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.purple,
//                         width: 2,
//                       ),
//                     ),
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       '\$${tx.expense}',
//                       style: TextStyle(
//                         color: Colors.purple,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         tx.title,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         DateFormat.yMMMd().format(tx.date),
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             );
//           }).toList(),
//     ),
//       );