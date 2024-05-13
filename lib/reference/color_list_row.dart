import 'package:flutter/material.dart';

class ListItemOneLine extends StatelessWidget {
  const ListItemOneLine({super.key});

  @override 
  Widget build(BuildContext context) {
    const title = "Horizontal List";

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160,
                color: Colors.red,
              ),
              Container(
                width: 160,
                color: Colors.blue,
              ),
              Container(
                width: 160,
                color: Colors.green,
              ),
              Container(
                width: 160,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                color: Colors.purple,
              ),
              Container(
                width: 160,
                color: Colors.orange,
              ),
              Container(
                width: 160,
                color: Colors.brown,
              )
            ],
          ),
        ),
      ),
    );
  }
}