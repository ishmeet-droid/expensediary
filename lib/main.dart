import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Models/transaction.dart';
import './Widgets/newtransaction.dart';
import './Widgets/transaction_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.grey,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(fontFamily: 'QuickSans', fontSize: 20)),
          )),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Transaction> userTransaction = [

  ];


  void addNewTransactions( String txTitle,
     double txAmount,
    DateTime dt) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: dt);
    setState(() {
      userTransaction.add(newtx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          // _ denotes faltu value jo accept karni br we have no use of it...

          return ListView(
            children: [
              GestureDetector(
                onTap: () {},
                child: NewTransaction(addNewTransactions),
                // behavior: HitTestBehavior.opaque,
              ),
            ],
          );
        });
  }
void deleteTransaction(String id){
    setState(() {
      userTransaction.removeWhere((tx){
        return tx.id == id;
      });
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Expense Tracker')
      ),

      body: ListView(
        children: <Widget>[

          TransactionList(userTransaction,deleteTransaction),
        ],
      ),
      //  ),

      // ],
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
