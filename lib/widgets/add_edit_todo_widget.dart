import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/providers/todo_providers.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_models.dart';
import 'info_widget.dart';

class AddEditTodoWidget extends StatelessWidget {
  const AddEditTodoWidget({super.key, required this.todo, required this.title});
  final String title;
  final TodoModel? todo;

  @override
  Widget build(BuildContext context) {
    TextEditingController _todoController = TextEditingController();

    if (todo != null) {
      _todoController.text = todo!.todo;
    }

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _todoController,
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
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Batal"),
        ),
        TextButton(
          onPressed: () {
            if (_todoController.text.isEmpty) {
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
                  TodoModel(id: todo!.id, todo: _todoController.text),
                );
                Navigator.pop(context);
              } else {
                const uuid = Uuid();
                Provider.of<TodoListProvider>(context, listen: false).addTodo(
                    TodoModel(id: uuid.v4(), todo: _todoController.text));
                Navigator.pop(context);
              }
            }
          },
          child: const Text("Simpan"),
        )
      ],
    );
  }
}
