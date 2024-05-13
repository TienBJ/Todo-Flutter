import 'package:flutter/material.dart';

class NewToDoScreen extends StatefulWidget {

  const NewToDoScreen({super.key});

  @override
  NewToDoScreenState createState() => NewToDoScreenState();
}

class NewToDoScreenState extends State<NewToDoScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New ToDo',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )),
        actions: [
          SizedBox(
            width: 65,
            child: IconButton(
              icon: const Icon(Icons.save,
              color: Colors.blue,
              size: 32,
              ),
              onPressed: _saveDataProps,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                    color: const Color(0x0ff1d167).withOpacity(0.11),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                    )
                  ]
                ),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Please input new ToDo here',
                    hintStyle: const TextStyle(
                      color: Color(0xffDDDADA),
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _saveDataProps() async {
    final todoText = _textEditingController.text.trim();
    if (todoText.isNotEmpty) {
      final newToDo = {
        'title': todoText,
        'time': DateTime.now(),
      };

      Navigator.pop(context, newToDo);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You have no fill todo!'),
          duration: Duration(seconds: 2)),
      );
    }
  }
}
