import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/views/new_todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetTodo());
  }
  
  _saveTodo(TodoModel todo) {
    context.read<TodoBloc>().add(SaveTodo(todo));
  }

  _refreshTodo() {
    context.read<TodoBloc>().add(RefreshTodo());
  }

  _alterTodo(int index) {
    context.read<TodoBloc>().add(AlterTodo(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )),
        actions: <Widget>[
          SizedBox(
            width: 65,
            child: IconButton(
              icon: const Icon(
              Icons.add,
              color: Colors.blue,
              size: 35,
              ),
              onPressed: () => _handleNavigateAndGetDataFromNewToDo(context),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _refreshTodo();
        },
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.status == TodoStatus.success) {
              return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ToDoItem(
                todo: state.todos[index],
                isLoading: state.status == TodoStatus.loading,
                onCheckedChange: (bool isDone) {
                  _alterTodo(index);
                },
                );
              },
            );
            } else {
              return const Center(child: CircularProgressIndicator());
            } 
          },
        ),
      ),
      )
    );
  }

  void _handleNavigateAndGetDataFromNewToDo(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const NewToDoScreen(),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      final todoModel = TodoModel(
        title: result['title'] ?? '',
        time: result['time'] ?? DateTime.now(),
      );

      _saveTodo(todoModel);
    }
  }
}
