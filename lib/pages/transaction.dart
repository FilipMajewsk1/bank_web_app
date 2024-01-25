import 'package:bank_web_app/controllers/SharedController.dart';
import 'package:bank_web_app/models/Account.dart';
import 'package:flutter/material.dart';

class transaction extends StatefulWidget {
  const transaction({Key? key}) : super(key: key);

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {

  TextEditingController titleController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController sumController = TextEditingController();

  late Future<Account> futureAccount;
  late Account account;

  @override
  void initState() {
    super.initState();
    futureAccount = SharedController.getAccount();
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
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: Colors.grey[850],
                  elevation: 15,
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Your balance:",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.amber
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                            child:FutureBuilder<Account>(
                                future: futureAccount,
                                builder:(context, snapshot) {
                                  if(snapshot.hasData){
                                    account = snapshot.data!;
                                    return Text(
                                      "${snapshot.data!.balance}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.amber[100]
                                      ),
                                    );
                                  } else{
                                    return CircularProgressIndicator();
                                  }
                                }
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 365, 1),
                child: Text(
                  "Title",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(250, 1, 250, 5),
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: titleController,
                    style: TextStyle(
                      color: Colors.amber[100],
                    ),
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelText: 'Enter the title of the transaction',
                      labelStyle: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 350, 1),
                child: Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(250, 1, 250, 5),
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.amber[100],
                    ),
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelText: 'Enter the name of the receiver',
                      labelStyle: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 270, 1),
                child: Text(
                  "Account number",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(250, 1, 250, 5),
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: accountController,
                    style: TextStyle(
                      color: Colors.amber[100],
                    ),
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelText: 'Enter the receivers account number',
                      labelStyle: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 367, 1),
                child: Text(
                  "Sum",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(250, 1, 250, 5),
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: sumController,
                    style: TextStyle(
                      color: Colors.amber[100],
                    ),
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelText: 'Enter the sum',
                      labelStyle: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OutlinedButton(
                  child: Text(
                    "Make transaction",
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
                    if(sumController.text!="" && titleController.text!="" && accountController!="") {
                      SharedController.makeTransfer(
                          titleController.text,
                          sumController.text,
                          accountController.text,
                          account.accountNumber);
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}