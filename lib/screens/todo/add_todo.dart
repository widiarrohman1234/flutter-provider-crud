import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../models/todo_models.dart';
import '../../providers/todo_providers.dart';
import '../../widgets/info_widget.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key, required this.title, required this.todo});
  final String title;
  final TodoModel? todo;
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

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

                      Provider.of<TodoListProvider>(context, listen: false)
                          .addTodo(
                              TodoModel(
                                id: uuid.v4(),
                                todo: _todoController.text,
                              ),
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
