import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/blocs/connection/internet_bloc.dart';
import 'file:///E:/Flutter%20Projects/foodie/lib/internet_service.dart';
import 'package:foodie/src/pages/nav_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavPage(),
    );
  }
}

