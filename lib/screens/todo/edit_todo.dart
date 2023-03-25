import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/todo_model.dart';
import '../../providers/todo_provider.dart';
import '../../widgets/info_widget.dart';

class EditTodo extends StatelessWidget {
  const EditTodo({super.key, required this.title, required this.todo});
  final String title;
  final TodoModel? todo;

  @override
  Widget build(BuildContext context) {
    TextEditingController todoController = TextEditingController();

    if (todo != null) {
      todoController.text = todo!.todo;
    }

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  isDense: true,
                  fillColor: Colors.grey.shade100,
                  labelText: "Todo",
                  hintText: "Masukkan todo"),
            )
          ],
        ),
      ),
      actions: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Batal"),
              ),
              TextButton(
                onPressed: () {
                  Provider.of<TodoListProvider>(
                    context,
                    listen: false,
                  ).removeTodo(todo!);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Hapus",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (todoController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const InfoWidget(
                            title: "Error !",
                            content: "Todo tidak boleh kosong",
                          );
                        });
                  } else {
                    if (todo != null) {
                      Provider.of<TodoListProvider>(context, listen: false)
                          .updateTode(
                        TodoModel(id: todo!.id, todo: todoController.text),
                      );
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text("Simpan"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
