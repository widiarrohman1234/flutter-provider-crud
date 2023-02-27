import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/providers/todo_providers.dart';

import '../widgets/add_edit_todo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo List Provider"),
      ),
      body: Consumer<TodoListProvider>(
        builder: (
          context,
          todoProvider,
          child,
        ) {
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: todoProvider.todoList.isNotEmpty
                ? todoProvider.todoList.map((todo) {
                    return Dismissible(
                      key: Key(todo.id),
                      background: Container(
                        color: Colors.red.shade300,
                        child: const Center(
                          child: Text(
                            "Hapus?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(todo.todo),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AddEditTodoWidget(
                                    title: "Edit Todo",
                                    todo: todo,
                                  );
                                });
                          },
                        ),
                      ),
                      onDismissed: (direction) {
                        Provider.of<TodoListProvider>(
                          context,
                          listen: false,
                        ).removeTodo(todo);
                      },
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
                return const AddEditTodoWidget(
                  title: "Tambah todo list",
                  todo: null,
                );
              });
        },
      ),
    );
  }
}
