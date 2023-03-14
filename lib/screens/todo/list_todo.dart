import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/todo_providers.dart';
import 'add_todo.dart';
import 'edit_todo.dart';

class ListTodo extends StatefulWidget {
  const ListTodo({super.key});

  @override
  State<ListTodo> createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoListProvider>(context, listen: false).getTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo List Provider Array Fix"),
      ),
      body: Consumer<TodoListProvider>(
        builder: (
          context,
          value,
          child,
        ) {
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: value.todoList.isNotEmpty
                ? value.todoList.map((todo) {
                    return Card(
                      child: ListTile(
                        title: Text(todo.todo),
                        trailing: const Icon(Icons.edit),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return EditTodo(
                                title: "Edit Todo",
                                todo: todo,
                              );
                            },
                          );
                        },
                      ),
                    );
                  }).toList()
                : [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: Text(
                          "Todo list masih kosong",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddTodo(title: "Tambah todo list", todo: null);
              });
        },
      ),
    );
  }
}
