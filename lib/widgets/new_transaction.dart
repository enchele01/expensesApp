import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransactionHandler;
  NewTransaction(this.newTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? _selectedDate;

  void submitData() {
    final enteredtitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredtitle.isEmpty ||
        enteredAmount.isEmpty ||
        double.parse(enteredAmount) < 0 ||
        _selectedDate == null) {
      print(enteredtitle);
      print(enteredAmount);
      return;
    }
    widget.newTransactionHandler(
        enteredtitle, double.parse(enteredAmount), _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

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
              onSubmitted: (_) => submitData(),

              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),

              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            Container(
              height: 70,
              child: Row(children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : 'Picked Date:${DateFormat.yMd().format(_selectedDate as DateTime)}',
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple,
                  ),
                  onPressed: _presentDatePicker,
                  child: Text(
                    "Choose Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ]),
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
                onPressed: submitData,
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
