import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
class  NewTransaction extends StatefulWidget {
   final Function newTransaction;
   NewTransaction(this.newTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime selectedDate;

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);


    if(enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        selectedDate == null)
      return ;
    widget.newTransaction(
        titleController.text,
        double.parse(amountController.text),
        selectedDate

    );
    Navigator.of(context).pop();//just pop sheet after submitting...
  }
  void datePicker(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(top:20,
            left:10,
            right: 10,
            bottom:MediaQuery.of(context).viewInsets.bottom + 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',

              ),
              controller: titleController,

            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              // onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(selectedDate == null ?'No Date chosen'
                  : DateFormat.yMd().format(selectedDate),
                  ),
                  FlatButton(onPressed: datePicker,
                      child: Text('Choose date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade600,
                        ),
                      )
                  )
                ],
              ),
            ),
            RaisedButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: submitData
            )

          ],
        ),
      );
  }
}
