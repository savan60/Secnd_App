import 'package:flutter/foundation.dart';
class Transaction {
  String id;
  String title;
  num expense;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.expense,
    @required this.date,
  });
}
