import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(children: transactions.map((tx){
        return Card(child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                padding: EdgeInsets.all(10),
                child: Text(
                  'RM ${tx.amount}',
                  // remove tx.amount.toString()
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple
                  ),
                )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('dd-MM-yyyy').format(tx.date),
                  style: TextStyle(
                    fontSize: 12, color: Colors.blueGrey,
                  ),
                )
              ],)
          ],
        ),);
      }).toList(),),
    );
  }
}
