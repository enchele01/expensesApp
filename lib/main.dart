import 'package:flutter/material.dart';
import 'package:myexpenses/widgets/new_transaction.dart';
import 'package:myexpenses/widgets/transaction_list.dart';
import 'package:myexpenses/widgets/user_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final titleController = TextEditingController();
  final amountCOntroller = TextEditingController();
  // String titleInput = "";
  // String amountInput = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyExpenses"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.greenAccent,
                  child: Text("Expenses"),
                ),
              ),
              UserTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
