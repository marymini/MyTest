import 'package:BoyGirlNew/forms/howtouse.dart';
import 'package:flutter/material.dart';
import '../forms/home.dart';

class DASHBOARD extends StatefulWidget {
  DASHBOARD({Key key}) : super(key: key);

  @override
  _DASHBOARDState createState() => _DASHBOARDState();
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class _DASHBOARDState extends State<DASHBOARD> {
  int age = 18;
  String mchild;
  var _child = ["BOY", "GIRL"];
  int _value = 1;
  final formKey = GlobalKey<FormState>();

  @override
  var _ages = [
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
  ];

  var _currentSelectd = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Option for Boy/Girl"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: FlatButton(
                    color: Colors.orange[200],
                    textColor: Colors.teal,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(6),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HowToUse()));
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.account_balance_wallet),
                        Text("How to Use")
                      ],
                    )),
              ),
            ],
          ),

          // SizedBox(
          //   height: 20,
          // ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Completed Age Of Mother",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown),
                  ),

                  DropdownButton<int>(
                    items: _ages.map((int dropDownStringItem) {
                      return DropdownMenuItem<int>(
                        value: dropDownStringItem,
                        child: Text("$dropDownStringItem"),
                      );
                    }).toList(),
                    onChanged: (int newvalueSelected) {
                      setState(() {
                        this._currentSelectd = newvalueSelected;
                        age = this._currentSelectd;
                      });
                    },
                    value: _currentSelectd,
                    underline: SizedBox(),
                  ),

                  // Text(
                  //   "Select Option",
                  //   style: TextStyle(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.brown),
                  // ),

                  // DropdownButton
                  // DropdownButton(
                  //   value: _value,
                  //   items: [
                  //     DropdownMenuItem(
                  //       child: Text("BOY"),
                  //       value: 1,
                  //     ),
                  //     DropdownMenuItem(
                  //       child: Text("GIRL"),
                  //       value: 2,
                  //     ),
                  //   ],
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _value = value;
                  //       if (_value == 1)
                  //         mchild = "BOY";
                  //       else
                  //         mchild = "GIRL";
                  //     });
                  //   },
                  //   underline: SizedBox(),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  //   child: Divider(
                  //     color: Colors.teal,
                  //   ),
                  // ),

                  ButtonBar(
                    children: <Widget>[
                      // RaisedButton(
                      //     child: Text("1"),
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => DASHBOARD()));
                      //     }),
                      RaisedButton(
                          child: Text("List Data"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // builder: (context) => Homepage(
                                    //     text: "$age", text1: "$mchild")));
                                    builder: (context) =>
                                        Homepage(text: "$age")));
                          }),
                    ],
                  )

                  // Divider(
                  //   color: Colors.teal,
                  // ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 10,
              child: Divider(
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
