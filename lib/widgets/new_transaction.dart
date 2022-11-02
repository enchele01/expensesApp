import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function newTransactionHandler;
  NewTransaction(this.newTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              keyboardType: TextInputType.text,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),

              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                onPressed: () {
                  // print('$titleInput and $amountInput');
                  // print('${titleController.text} and ${amountController.text}');
                  newTransactionHandler(
                      titleController.text, amountController.text);
                },
                child: Text(
                  "Add Transaction",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
