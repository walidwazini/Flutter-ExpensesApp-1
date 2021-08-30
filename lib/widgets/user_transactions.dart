import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  //const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 89.80, date: DateTime.now()),
    Transaction(id: 't2', title: 'Nescafe', date: DateTime.now(), amount: 17.40),
    Transaction(id: 't3', title: 'Roti', date: DateTime.now(), amount: 3.20),
    Transaction(id: 't3', title: 'Jam', date: DateTime.now(), amount: 6.20),
    Transaction(id: 't3', title: 'Lunch', date: DateTime.now(), amount: 13.20)
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        date: DateTime.now(),
        amount: txAmount,
    );

    setState(() {
      _userTransactions.add(newTx);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
