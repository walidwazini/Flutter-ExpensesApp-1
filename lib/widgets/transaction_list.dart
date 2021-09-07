import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    var color1 = Theme.of(context).primaryColor;

    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    ' No transaction here',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'RM ${transactions[index].amount.toStringAsFixed(2)}',
                          // remove tx.amount.toString()
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: color1,
                          ),
                        )),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(transactions[index].date),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blueGrey,
                              ),
                            )
                          ],
                        ),
                        Container(
                            child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.info),
                              color: Colors.grey.shade400,
                              onPressed: () {
                                print(transactions[index].id);
                              },
                            ),
                            IconButton(
                              onPressed: () => deleteTx(transactions[index].id),
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                            )
                          ],
                        )),
                      ],
                    )),
                  ],
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
