import 'package:bank_web_app/controllers/SharedController.dart';
import 'package:bank_web_app/pages/home.dart';
import 'package:bank_web_app/tools/DataValidation.dart';
import 'package:bank_web_app/tools/StateControll.dart';
import 'package:bank_web_app/widgets/error_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Password.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {

  TextEditingController emaliController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var passwordInstructions;
  Lstate lstate = Lstate.WAITING_FOR_LOGIN;
  String positions = "";
  final _loginKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 200, 0, 5),
                  child: Text(
                    "Log to your account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.amber
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 300,
                    child: Form(
                      key: _loginKey,
                      child: TextFormField(
                        controller: emaliController,
                        style: TextStyle(
                          color: Colors.amber[100],
                        ),
                        cursorColor: Colors.amber,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber, width: 2.0),
                          ),
                          labelText: 'Login',
                          labelStyle: TextStyle(
                            color: Colors.amber,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field cannot be empty';
                          } else if (DataValidator.isValidEmail(value) == false) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 300,
                    child: Form(
                      key:_passwordKey,
                      child: TextFormField(
                        controller: passwordController,
                        style: TextStyle(
                          color: Colors.amber[100],
                        ),
                        cursorColor: Colors.amber,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber, width: 2.0),
                          ),
                          labelText: 'Password combination:',
                          labelStyle: TextStyle(
                            color: Colors.amber,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field cannot be empty';
                          } else if (DataValidator.isLengthThree(value) == false) {
                            return 'Invalid password length';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: OutlinedButton(
                        child: Text(
                          "Enter email",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.amber),
                        ),
                        onPressed: () async{
                          if(_loginKey.currentState?.validate() != false && lstate == Lstate.WAITING_FOR_LOGIN){
                            passwordInstructions = await SharedController.getPassword(emaliController.text);
                            if(passwordInstructions is String){
                              showErrorDialog(context, passwordInstructions);
                            }else{
                              positions = passwordInstructions!.positions.join(" ");
                              setState(() {
                                lstate = Lstate.WAITING_FOR_PASSWORD;
                              });
                            }
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
                      child: OutlinedButton(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.amber),
                        ),
                        onPressed: () async{
                          if(_loginKey.currentState?.validate() != false &&
                              lstate == Lstate.WAITING_FOR_PASSWORD &&
                              _passwordKey.currentState?.validate() != false){

                            Future.delayed(Duration(seconds: 3), () async{
                              var result = await SharedController.logIn(
                                  passwordInstructions!.id!,
                                  emaliController.text,
                                  passwordController.text);
                              if(result is String){
                                showErrorDialog(context, result);
                              }
                              else {
                                setState(() {
                                  lstate = Lstate.WAITING_FOR_RESPONSE;
                                });
                                var stateControll = Provider.of<StateControll>(
                                    context, listen: false);
                                stateControll.setStateLogin(result);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => home()));
                              }
                            });
                          }
                        },
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: lstate != Lstate.WAITING_FOR_PASSWORD ? Text(
                    "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.amber
                    ),
                  ) : Text(
                    "Your combination" + positions,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.amber
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      )
    );
  }
}

enum Lstate {WAITING_FOR_LOGIN, WAITING_FOR_PASSWORD, WAITING_FOR_RESPONSE}