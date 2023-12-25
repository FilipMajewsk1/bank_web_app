import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Padding(
            padding: EdgeInsets.fromLTRB(350, 200, 350, 0),
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  child: TextField(
                    style: TextStyle(
                      color: Colors.amber, // Ustawienie koloru wpisywanego tekstu na czerwony
                    ),
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2.0), // Ustawienie koloru obwodu przy fokusie na czerwony
                      ),
                      labelText: 'Login',
                      labelStyle: TextStyle(
                        color: Colors.amber, // Kolor etykiety
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.amber, // Ustawienie koloru wpisywanego tekstu na czerwony
                    ),
                    cursorColor: Colors.amber,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2.0), // Ustawienie koloru obwodu przy fokusie na czerwony
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.amber, // Kolor etykiety
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
              ],
            )
        )
      )
    );
  }
}