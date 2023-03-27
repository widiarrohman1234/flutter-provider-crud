class TODOMODEL {
  late final String xyz;
  late final String todo;

  TODOMODEL({
    required this.xyz,
    required this.todo,
  });

  TODOMODEL.fromJson(Map<String, dynamic> json) {
    xyz = json['xyz'];
    todo = json['todo'];
  }

  Map<String, dynamic> toJson() => {
        'xyz': xyz,
        'todo': todo,
      };
}
