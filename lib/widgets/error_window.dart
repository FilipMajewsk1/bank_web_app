import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Error",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.amber
        ),
      ),
      backgroundColor: Colors.grey[850],
      actions: <Widget>[
        OutlinedButton(
          child: Text(
            "Ok",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.amber
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.amber),
          ),
          onPressed: () {
           Navigator.of(context).pop();
            }
        ),
      ],
    );
  }
}
void showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ErrorDialog();
    },
  );
}