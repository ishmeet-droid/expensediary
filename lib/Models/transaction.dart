import 'package:flutter/material.dart';

class Transaction {
  String id;

  String title;
  double amount;

  //Date - Time ...

  DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
  //@required is a decorator....
}
