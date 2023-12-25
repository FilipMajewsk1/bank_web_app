import 'package:flutter/material.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {

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