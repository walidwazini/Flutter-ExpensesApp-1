import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactionsList = [
    Transaction(id: 't1', title: 'New Shoes', amount: 89.80,date: DateTime.now()),
    Transaction(id: 't2', title: 'Nescafe', date: DateTime.now(), amount: 17.40)
  ];

  // late String titleInput;
  // var  amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Expenses App'),),
      body:  Column (
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
        Container( width: double.infinity,
          child: Card(
            color: Colors.purple,
            child: Text('Chart'),
            elevation: 5,
          ) ,
        ),
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val){
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              //onChanged: (val) => amountInput = val,
            ),
              ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: (){
                  print(titleController.text);
                  print(amountController.value);
                },
              ),
        ],),
          ),),
        Column(children: transactionsList.map((tx){
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
        }).toList(),)
      ],),
    );
  }
}

