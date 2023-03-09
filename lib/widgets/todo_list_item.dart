import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoListItem extends StatefulWidget {
  final Todo todo;

  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todo.isCompleted,
        onChanged: (bool? value) {
          setState(() {
            widget.todo.isCompleted = value!;
          });
        },
      ),
      title: Text(widget.todo.description),
    );
  }
}
