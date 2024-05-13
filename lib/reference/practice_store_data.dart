import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouterStore extends StatefulWidget {
  const CouterStore({super.key});

  @override
  State<CouterStore> createState() => _CouterStoreState();
}

class _CouterStoreState extends State<CouterStore> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _count = (prefs.getInt('count') ?? 0);
    });
  }

  void _increment() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _count = (prefs.getInt('count') ?? 0) + 1;
      prefs.setInt('count', _count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle couter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('You have push the button many times: '),
              Text('$_count', 
              style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}