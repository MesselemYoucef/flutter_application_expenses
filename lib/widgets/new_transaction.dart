import 'package:flutter/material.dart';
import 'package:flutter_application_expenses/widgets/user_transactions.dart';


class NewTransaction extends StatefulWidget {
  final Function  _addNewTransactions;

  NewTransaction(this._addNewTransactions);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
   widget._addNewTransactions(enteredTitle, enteredAmount);
   Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Title",
                    ),
                    controller: titleController,
                    onSubmitted: (_)=>submitData(),
                    // onChanged: (value){titleInput = value;},
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Amount",
                    ),
                    controller: amountController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_)=> submitData(),
                    // onChanged: (value){amountInput = value;},
                  ),
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.purple)),
                    // onPressed: () {print(titleInput);print(amountInput);},
                    onPressed: (){      
                     submitData();
                      },
                    child: const Text("Add Transaction"),
                  ),
                ],
              ),
            ),
          );
  }
}