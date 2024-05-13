import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/model/todo_model.dart';

class ToDoItem extends StatelessWidget {
  final TodoModel todo;
  final void Function(bool)? onCheckedChange;
  final bool isLoading;

  const ToDoItem({super.key, required this.todo, this.onCheckedChange, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    String _timeHandle = DateFormat('EEE, MMM d, HH:mm a').format(todo.time);

    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            alignment: Alignment.center,
            color: _randomColor(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          todo.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: todo.isDone ? TextDecoration.lineThrough : null,
                            decorationThickness: 5.8,
                            decorationColor: Colors.red,
                          ),
                        ),
                        Text(
                          _timeHandle,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: isLoading ? [ 
                        const Row( children: [
                          CircularProgressIndicator(),
                        ]                                        
                      ),
                    ] : [   
                       Checkbox(
                        onChanged: (bool? value) {
                          if (onCheckedChange != null) {
                            onCheckedChange!(value ?? false);
                          }
                        },
                        value: todo.isDone,
                      ),
                    ],
                  ),
                ),
                const SizedBox( width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _randomColor() {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.brown,
    ];

    return colors[DateTime.now().millisecondsSinceEpoch % colors.length];
  }
}
