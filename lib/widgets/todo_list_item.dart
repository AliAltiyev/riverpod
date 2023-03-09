import 'package:flutter/material.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({Key? key}) : super(key: key);

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Checkbox(
        value: true,
        onChanged: (bool? value) {},
      ),
      title: Text('Go to Gym'),
    );
  }
}
