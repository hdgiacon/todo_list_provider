import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_provider/app/models/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel model;
  final dateFormat = DateFormat('dd/MM/y');

  Task({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(color: Colors.grey),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(width: 1.0),
          ),
          leading: Checkbox(
            value: model.finished,
            onChanged: (value) {},
          ),
          title: Text(
            model.description,
            style: TextStyle(
              decoration: model.finished ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            dateFormat.format(model.dateTime),
            style: TextStyle(
              decoration: model.finished ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }
}