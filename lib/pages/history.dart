import 'package:bank_web_app/widgets/history_card.dart';
import 'package:flutter/material.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {

  List<String> names = ["Stefan Hula", "Kamil Stoch"];
  List<String> sums = ["+ 2000", "- 300"];
  List <String> dates = ["12.10.2023", "30.04.2022"];
  List <String> accountNumbers = ["11 1111 1111 11111 1111 1111 1111", "22 2222 2222 2222 2222 2222 2222"];
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

      body: SingleChildScrollView(
        child: Center(
          child:SizedBox(
            width: 550,
            height: 1000,
            child: buildHistory(names, sums, dates, accountNumbers)
          ),
        ),
      ),
    );
  }
  Widget buildHistory(List<String> names, List<String> sums, List<String> dates, List<String> accountNumbers) =>
    ListView.builder(
      itemCount:  names.length,
      itemBuilder: (context, index){
        final name = names[index];
        final date = dates[index];
        final sum = sums[index];
        final accountNumber = accountNumbers[index];
        return historyCard(
          name: name,
          sum: sum,
          date: date,
          accountNumber: accountNumber,
        );
      }
    );

}