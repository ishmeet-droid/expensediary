import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return
    Container(
      height: MediaQuery.of(context).size.height * 0.85 ,
      child:transactions.isEmpty? Column(
          children: <Widget>[
            Text("Empty List",style:
            TextStyle(
                fontSize: 30
            ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                height: 100,
                child: Image.asset('Assets/image/waiting.png',fit: BoxFit.cover,))
          ]
      ) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            shadowColor: Colors.purple.shade400,

            margin: EdgeInsets.all(8),
            child: ListTile(

              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FittedBox(
                    child: Text('\$' + transactions[index].amount.toStringAsFixed(2),
                      style: TextStyle(
                        color:  Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),

                    ),
                  ),
                ),
              ),

              title: Text(
              transactions[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            subtitle: Text(
                DateFormat.yMd().format(transactions[index].date),
                style: TextStyle(color:  Colors.grey
                )
            ),
            trailing: IconButton(icon: Icon( Icons.delete,
              color: Colors.red.shade500,),
              onPressed: () => deleteTx(transactions[index].id),
            ) ,
            ),
          );

              //below work can be easily done with ListTile
          //   Card(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: <Widget>[
          //       Container(
          //           padding: EdgeInsets.all(5),
          //           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //                 color: Theme.of(context).primaryColor,
          //                 width: 2,
          //                 style: BorderStyle.solid),
          //           ),
          //           child: Text(
          //             '\$' + transactions[index].amount.toStringAsFixed(2),
          //             style: TextStyle(
          //               color:  Colors.grey,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 15,
          //             ),
          //           )),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.all(2.0),
          //             child: Text(
          //               transactions[index].title,
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //           Text(
          //               DateFormat('yyyy-MM-dd')
          //                   .format(transactions[index].date),
          //               style: TextStyle(color:  Colors.grey
          //               )
          //           ),
          //         ],
          //       ),
          //
          //     ],
          //   ),
          // );
        },
        itemCount: transactions.length,
        // children: transactions.map((tx) {
        //   return
        //   "The above return is same
        //   as this bt above we do not need
        //   map function"
        // }).toList(),
      ),
    );
  }
}
