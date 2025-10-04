import 'package:flutter/material.dart';
import '../models/task.dart';


class TaskTile extends StatelessWidget {
final Task task;
final VoidCallback onDelete;


const TaskTile({
super.key,
required this.task,
required this.onDelete,
});


@override
Widget build(BuildContext context) {
return Card(
margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
child: ListTile(
title: Text(task.title),
trailing: IconButton(
icon: const Icon(Icons.delete, color: Colors.red),
onPressed: onDelete,
),
),
);
}
}