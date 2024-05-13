import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/todo_model.dart';

class DataService {
  Future<List<TodoModel>> fetchTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? todoListString = prefs.getStringList('todo_list');
    List<TodoModel> todoList = [];
    
    if (todoListString != null) {
      todoList = todoListString.map<TodoModel>((todo) {
        List<String> splitTodo = todo.split('|||');
        return TodoModel(
          title: splitTodo[0],
          isDone: splitTodo[1] == 'true',
          time: DateTime.parse(splitTodo[2]),
        );
      }).toList();
    }
    return todoList;
  }
}
