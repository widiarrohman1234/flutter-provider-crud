import 'package:flutter/material.dart';

import '../models/todomodels.dart';

class TodoListProvider with ChangeNotifier {
  List<TODOMODEL> _todoList = [];
  List<TODOMODEL> get todoList => _todoList;
  bool isLoading = false;

  Future<void> getTodo() async 
  {
    isLoading = false;
    notifyListeners();

    _todoList = todoList;

    isLoading = false;
    notifyListeners();
  }

  void addTodo(TODOMODEL todo) 
  {
    _todoList.add(todo);
    notifyListeners();
  }

  void removeTodo(TODOMODEL todo) 
  {
    _todoList = _todoList.where((item) => item.xyz != todo.xyz).toList();
    notifyListeners();
  }

  void updateTode(TODOMODEL todo) 
  {
    _todoList[_todoList.indexWhere((item) => item.xyz == todo.xyz)] = todo;
    notifyListeners();
  }
}
