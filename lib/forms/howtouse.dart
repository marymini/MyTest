import 'package:flutter/material.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How To Use this App"),
      ),
      body: Container(
        color: Colors.orange[200],
        height: 200,
        child: Card(
          child: Text(
            "Automating the Chineese Calender for Selecting BOY/GIRL.Select the Completed Age of mother.",
            style: TextStyle(
              color: Colors.brown,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
