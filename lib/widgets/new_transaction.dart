import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate ;

  void _submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return ;
    }
    widget.addTx(
        enteredTitle,
        enteredAmount
    );
    Navigator.of(context).pop();
  }

  // Method to show date picker
  void _toggleDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now()
    ).then((pickedDate){
      if (pickedDate == null) {
        return ;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val){ titleInput = val;},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              //onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 80,
              child: Row( children: [
                Text(_selectedDate == null ? 'N/A' : 'Picked date : ${DateFormat.yMd().format(_selectedDate!)}'),
                SizedBox(width: 20,),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: Colors.purple,
                      side: BorderSide( color: Theme.of(context).primaryColor)
                  ),
                  child: Text( 'Pick Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _toggleDatePicker,
                )
              ],),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
