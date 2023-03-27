import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoListProvider with ChangeNotifier {
  List<TodoModel> _todoList = [];
  List<TodoModel> get todoList => _todoList;
  bool isLoading = false;

  Future<void> getTodo() async {
    isLoading = false;
    notifyListeners();

    _todoList = todoList;

    isLoading = false;
    notifyListeners();
  }

  void addTodo(TodoModel todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todoList = _todoList.where((item) => item.id != todo.id).toList();
    notifyListeners();
  }

  void updateTode(TodoModel todo) {
    _todoList[_todoList.indexWhere((item) => item.id == todo.id)] = todo;
    notifyListeners();
  }
}
