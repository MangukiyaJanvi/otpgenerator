import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController txtn = TextEditingController();

  List l1 = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List otp = [];
  List rndlist = [];
  int i = 0,
      n = 0,
      z = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("OTP Generator"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
          Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: txtn,
            decoration: InputDecoration(
                label: Text(
                  "Enter The Number",
                  style: TextStyle(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
        ),
        InkWell(
          onTap: () {
            rndlist = [];
            var rnd = Random();
            n = int.parse(txtn.text);
            setState(() {
              otp.length = n;
              for (i = 0; i < otp.length; i++) {
                z = rnd.nextInt(10);
                rndlist.add(z);
                Text("$rndlist");
              }
            });
          },
          child: Container(
            height: 50,
            width: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "Generate",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rndlist
                  .asMap()
                  .entries
                  .map((e) => Container(
              height: 50,
              width: 50,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("${rndlist[e.key]}")))
              .toList(),
        ),
      ),
      InkWell(
        onTap: () {
          txtn.clear();
          rndlist = [];
          setState(() {});
        },
        child: Container(
          height: 50,
          width: 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            "Reset",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      ],
    ),)
    ,
    )
    ,
    );
  }
}
