import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
       colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Colors.purple,
        secondary: Colors.amber,
       ),
       fontFamily: "OpenSans",
       textTheme: ThemeData.light().textTheme.copyWith(
        titleSmall: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 18),
       ),
       appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
       )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 'T1', title: "New shoes", amount: 10.99, date: DateTime.now()),
    // Transaction(
    //     id: 'T2',
    //     title: "Weekly Groceries",
    //     amount: 99.99,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 'T3',
    //     title: "Car Maintenance",
    //     amount: 102.99,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 'T4', title: "New Cloths", amount: 47.99, date: DateTime.now()),
  ];

  void _addNewTransactions(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  // String? titleInput;
  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: (){},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransactions),
            );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
        actions: [IconButton(onPressed: () {_startAddNewTransaction(context);}, 
        icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                elevation: 5.0,
                color: Colors.blue,
                child: Text("Chart"),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {_startAddNewTransaction(context);},
        child: Icon(Icons.add),
      ),
    );
  }
}
