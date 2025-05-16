import 'package:flutter/material.dart';
import 'package:notesapp/feature/home/models/task_model.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
    required this.task,
    required this.onDelete,
    this.isDeleting = false,// Add a callback for deletion
  });

  final TaskModel task;
  final VoidCallback onDelete;
  final bool isDeleting;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.label, color: Colors.white),
      title: Text(
        task.title ?? 'No Title',
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        task.description ?? 'No Title',
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: isDeleting
          ? const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(strokeWidth: 2 ,backgroundColor: Colors.red,),
      )
          : IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}
