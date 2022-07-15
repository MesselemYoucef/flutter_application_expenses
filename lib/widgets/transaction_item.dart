import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem(
      {Key? key, required this.transaction, required this.deleteTransaction})
      : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _chosenBGColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const avaibaleColors = [
      Colors.black,
      Colors.blue,
      Colors.purple,
      Colors.amber
    ];

    _chosenBGColor = avaibaleColors[Random().nextInt(avaibaleColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _chosenBGColor,
          foregroundColor: Colors.white,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                onPressed: () {
                  return widget.deleteTransaction(widget.transaction.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {
                  return widget.deleteTransaction(widget.transaction.id);
                },
              ),
      ),
    );
  }
}
