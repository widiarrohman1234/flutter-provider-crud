import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/todoProvider.dart';
import 'screens/todo/list_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListProvider()),
      ],
      child: MaterialApp(
        title: 
        'Todo List Provider Array',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListTodo(),
      ),
    );
  }
}
