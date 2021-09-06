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

    return Container(
      height: MediaQuery.of(context).size.height * 0.6 ,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  ' No transaction here',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
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
                          Container(child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.info),
                                color: Colors.grey.shade400,
                                onPressed: (){
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
            ),
      // : ListView.builder(
      //     itemBuilder: (ctx, index) {
      //       return Card(
      //         margin: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
      //         child: ListTile(
      //           leading: CircleAvatar(
      //             radius: 30,
      //             child: Padding(
      //               padding: const EdgeInsets.all(5.0),
      //               child: FittedBox(child: Text('RM ${transactions[index].amount}')),
      //             ),
      //           ),
      //           title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6,),
      //           subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
      //
      //         ),
      //       );
      //     },
      //     itemCount: transactions.length,
    );
  }
}
