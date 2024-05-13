import 'package:todo_app/repository/todo_repository.dart';

import '../model/todo_model.dart';

class TodoService {
  final TodoRepository _repository = TodoRepository();

  Future<List<TodoModel>> getTodoList() => _repository.fetchTodoList();

  Future<void> saveTodo(List<TodoModel> todo) => _repository.saveToDoList(todo);

  Future<void> refreshTodo() => _repository.refreshToDoList();

  Future<void> alterCheckTodo(List<TodoModel> todo) => _repository.onChangeIsDone(todo);
}