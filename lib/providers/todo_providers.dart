import 'package:flutter/material.dart';

import '../models/todo_models.dart';

class TodoListProvider with ChangeNotifier {
  List<TodoModel> _todoList = [];

  List<TodoModel> get todoList => _todoList;

  // void getTodo()  {
  //   try {
  //     List<TodoModel> todoList =  todoList.getTodoData();
  //     _todoList = todoList;
  //     print(_todoList);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
