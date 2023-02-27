import 'dart:convert';

class TodoModel {
  final String id;
  final String todo;
  TodoModel({
    required this.id,
    required this.todo,
  });

  TodoModel copyWith({
    String? id,
    String? todo,
  }) {
    return TodoModel(
      id: id ?? this.id,
      todo: todo ?? this.todo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'todo': todo,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as String,
      todo: map['todo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TodoModel(id: $id, todo: $todo)';

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.todo == todo;
  }

  @override
  int get hashCode => id.hashCode ^ todo.hashCode;
}
