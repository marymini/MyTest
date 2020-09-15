import 'package:flutter/material.dart';
import '../models/child.dart';
import '../utils/db_helper.dart';

class Homepage extends StatefulWidget {
  // Homepage({Key key}) : super(key: key);
  final String text;
  // final String text1;
  // Homepage({Key key, @required this.text, @required this.text1})
  //     : super(key: key);
  Homepage({Key key, @required this.text}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState(text);
  // _HomepageState createState() => _HomepageState(text, text1);
}

class _HomepageState extends State<Homepage> {
  var dbHelper;

  Future<List<Child>> childs;

  // Color getColor($child) {
  //   if ($child == "BOY") return Colors.red;
  //   if ($child == "GIRL") return Colors.blue;
  // }

  // Color textColor = Colors.black;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    // childs = dbHelper.listChild(text);
    getchildlist();
  }

  getchildlist() async {
    setState(() {});

    setState(() {
      childs = dbHelper.listChild(text);
      //  childs = dbHelper.listChild(text, text1);
    });
  }

  // Dismissible buildChildWidget(Child child) {
  //   return Dismissible(
  //     key: Key("${child.id}"),
  //     child: ListTile(
  //       title: Text(
  //         "Conceiving Month: ${child.month} ",
  //         style: TextStyle(
  //           fontSize: 14,
  //           fontWeight: FontWeight.bold,
  //           color: (child.child == "BOY") ? Colors.pink : Colors.teal,
  //         ),
  //       ),
  //       subtitle: Text("  You can Expect a   ${child.child}  Child  ",
  //           style: TextStyle(
  //               color: (child.child == "BOY") ? Colors.pink : Colors.teal,
  //               fontSize: 12,
  //               fontWeight: FontWeight.bold)),
  //     ),
  //   );
  // }

  Card buildChildWidget(Child child) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      child: ListTile(
        title: Text(
          "If Conceiving Month: ${child.month} , Expect   ${child.child}  Child ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: (child.child == "BOY") ? Colors.brown : Colors.deepOrange,
          ),
        ),

        // subtitle: Text("  You can Expect a   ${child.child}  Child  ",
        //     style: TextStyle(
        //         color: (child.child == "BOY") ? Colors.brown : Colors.deepOrange,
        //         fontSize: 12,
        //         fontWeight: FontWeight.bold)),
      ),
    );
  }

  String text;
  String text1;
  _HomepageState(this.text);
  // _HomepageState(this.text, this.text1);
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Option for Boy/Girl"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                // "Options For $text1  @Age $text",
                "Options For Child  @Age $text",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Container(
                color: Colors.teal,
                height: 2,
              ),
            ),
            FutureBuilder<List<Child>>(
              future: childs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: snapshot.data
                          .map((child) => buildChildWidget(child))
                          .toList(),
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
