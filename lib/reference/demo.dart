import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  MaterialColor _materialColor = Colors.blue;

  void _setNewState(MaterialColor color) {
  setState(() {
    _materialColor = color;
    }
  );
}

  @override
  Widget build (BuildContext context) {
    return Theme(
      data: ThemeData.from(colorScheme: ColorScheme.fromSwatch(primarySwatch: _materialColor)), 
      child: Scaffold(
        body: Center(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed:() => _setNewState(Colors.red), child: const Icon(Icons.light_mode)),
            TextButton(onPressed:() => _setNewState(Colors.grey), child: const Icon(Icons.dark_mode)), 
          ],
        ),
        )
      )
    );
  }
}
