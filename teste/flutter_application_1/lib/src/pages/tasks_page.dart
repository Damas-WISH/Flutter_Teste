import 'package:flutter/material.dart';
import '../services/db_tasks.dart';
import '../models/task.dart' hide DBTasks;
import '../widgets/task_tile.dart';


class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

@override
State<TasksPage> createState() => _TasksPageState();
}


class _TasksPageState extends State<TasksPage> {
late Future<List<Task>> _tasksFuture;


@override
void initState() {
super.initState();
_loadTasks();
}


void _loadTasks() {
_tasksFuture = DBTasks.instance.readAllTasks();
}


void _addTask() async {
await DBTasks.instance.create(Task(title: 'Nova tarefa'));
setState(() => _loadTasks());
}


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Tarefas')),
body: FutureBuilder<List<Task>>(
future: _tasksFuture,
builder: (context, snapshot) {
if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
final tasks = snapshot.data!;
if (tasks.isEmpty) return Center(child: Text('Nenhuma tarefa'));
return ListView.builder(
itemCount: tasks.length,
itemBuilder: (context, index) {
final t = tasks[index];
return TaskTile(task: t, onDelete: () async {
await DBTasks.instance.delete(t.id!);
setState(() => _loadTasks());
});
},
);
},
),
floatingActionButton: FloatingActionButton(
onPressed: _addTask,
child: Icon(Icons.add),
),
);
}
}