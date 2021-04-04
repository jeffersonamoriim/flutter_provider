import 'package:flutter/material.dart';
import 'package:flutter_provider/screens/transfer/list.dart';

void main() => runApp(SoftBank());

class SoftBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurpleAccent,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: TransferList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
