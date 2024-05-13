part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override 
  List<TodoModel?> get props => [];
}

class GetTodo extends TodoEvent {}

class SaveTodo extends TodoEvent {
  final TodoModel todo;
  const SaveTodo(this.todo);

  @override 
  List<TodoModel?> get props => [todo];
}

class RefreshTodo extends TodoEvent {}

class AlterTodo extends TodoEvent {
  final int index;
  const AlterTodo(this.index);

  @override
  List<TodoModel?> get props => [];
}

