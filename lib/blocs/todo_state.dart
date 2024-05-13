part of 'todo_bloc.dart';

enum TodoStatus {initial, loading, success, error, refresh}

class TodoState extends Equatable {
  final List<TodoModel> todos;
  final TodoStatus status;

  const TodoState({
    this.todos = const <TodoModel>[],
    this.status = TodoStatus.initial,
  });

  TodoState copyWith({
    TodoStatus? status,
    List<TodoModel>? todos,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }

  @override 
  factory TodoState.fromJson(Map<String, dynamic>json) {
    try {
      var listOfTodos = (json['todo'] as List<dynamic>)
      .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
      .toList();

      return TodoState(
        todos: listOfTodos,
        status: TodoStatus.values.firstWhere(
          (element) => element.name.toString() == json['status']
        )
      );
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'todo': todos,
      'status': status,
    };
  }

  @override 
  List<Object?> get props => [status, todos];
}