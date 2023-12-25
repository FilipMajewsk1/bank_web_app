import 'package:flutter/material.dart';

class transaction extends StatefulWidget {
  const transaction({Key? key}) : super(key: key);

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(
        "HoneyMoney.pl",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.grey[850]
        ),
      ),
        backgroundColor: Colors.amber,
        iconTheme: IconThemeData(
          color: Colors.grey[850],
        ),
      ),
    );
  }
}