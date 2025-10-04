class Task {
  final int? id;
  final String title;
  final String? description;
  final bool done;

  Task({
    this.id,
    required this.title,
    this.description,
    this.done = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'done': done ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      done: map['done'] == 1,
    );
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? done,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
    );
  }
}

// Método atualizado para DBTasks (readTask)
// Retorna Task? se não encontrar
Future<Task?> readTask(int id) async {
  final db = await DBTasks.instance.database;
  final maps = await db.query(
    'tasks',
    where: 'id = ?',
    whereArgs: [id],
  );

  if (maps.isNotEmpty) {
    return Task.fromMap(maps.first);
  }

  return null; // agora compatível com tipo Task?
}

class DBTasks {
  static var instance;
}
