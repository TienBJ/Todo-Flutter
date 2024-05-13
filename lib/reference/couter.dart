import 'package:flutter/material.dart';
import 'package:todo_app/reference/demo_bloc.dart';

class CouterWidget extends StatefulWidget {
  @override
  _CouterWidgetState createState() => _CouterWidgetState();
}

class _CouterWidgetState extends State<CouterWidget> {
  final CouterBloc _couterBloc = CouterBloc();

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Couter App',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 43,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _couterBloc.couterStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              '${snapshot.data}', 
              style: const TextStyle(fontSize: 24)
            );
          } else { return const CircularProgressIndicator();
          }
        },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _couterBloc.incrementCouter();
        },
        child: const Icon(Icons.add)
      ),
    );
  }
  @override
  void dispose() {
    _couterBloc.dispose();
    super.dispose();
  }
}
