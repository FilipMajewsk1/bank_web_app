import 'dart:js';

import 'package:bank_web_app/pages/home.dart';
import 'package:bank_web_app/pages/login.dart';
import 'package:bank_web_app/pages/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
    '/login': (context) => login(),
    '/home': (context) => home(),
    '/transaction': (context) => transaction(),
    '/history': (context) => home(),
  },
  )
);