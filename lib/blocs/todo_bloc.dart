import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/service/todo_service.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _todoService = TodoService();

  TodoBloc() : super(const TodoState()) {
    on<GetTodo>(_onGetTodo);
    on<SaveTodo>(_onSaveTodo);
    on<AlterTodo>(_onAlterTodo);
    on<RefreshTodo>(_onRefreshTodo);
  }

  void _onGetTodo(
    GetTodo event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final todos = await _todoService.getTodoList();

      todos.sort((a, b) => b.time.compareTo(a.time));

      emit (
        state.copyWith(
          todos: todos,
          status: TodoStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
        ),
      );
    }
  }

  void _onSaveTodo(
    SaveTodo event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );
    
    try {
      final todos = state.todos;
      todos.add(event.todo);

      await _todoService.saveTodo(todos);

      todos.sort((a, b) => b.time.compareTo(a.time));


      emit(
        state.copyWith(
          status: TodoStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
        ),
      );
    }
  }

  void _onRefreshTodo(
    RefreshTodo event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );

    try {
      await _todoService.refreshTodo();
      final todos = await _todoService.getTodoList();
      emit(
        state.copyWith(
          todos: todos,
          status: TodoStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
        ),
      );
    }
  }

  void _onAlterTodo(
    AlterTodo event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );

    try {
      final todos = state.todos;

      await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));

      todos[event.index].isDone = !todos[event.index].isDone;

      await _todoService.alterCheckTodo(todos);
      emit(
        state.copyWith(
          todos: todos,
          status: TodoStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
        ),
      );
    }
  }
}
