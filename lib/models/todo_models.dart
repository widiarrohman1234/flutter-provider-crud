class TodoModel {
  late final String id;
  late final String todo;

  TodoModel({
    required this.id,
    required this.todo,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'todo': todo,
      };
}
