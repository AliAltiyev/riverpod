import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stateManagmentRiverpod/provider/provider.dart';

import '../model/todo.dart';

class TodoListItem extends ConsumerStatefulWidget {
  final Todo todo;

  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  @override
  ConsumerState createState() => _TodoListItemState();
}

class _TodoListItemState extends ConsumerState<TodoListItem> {
  bool _hasFocuse = false;
  final _descriptionTextController = TextEditingController();
  final _textFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (isFocused) {
        if (!isFocused) {
          setState(() {
            _hasFocuse = false;
            ref
                .read(toDoListProvider.notifier)
                .editTodo(widget.todo.id, _descriptionTextController.text);
          });

        }
      },
      child: ListTile(
          onTap: () {
            setState(() {
              _hasFocuse = true;
              _textFocusNode.requestFocus();
              _descriptionTextController.text = widget.todo.description;
            });
          },
          leading: Checkbox(
              value: widget.todo.isCompleted,
              onChanged: (bool? value) {
                ref.read(toDoListProvider.notifier).toggle(widget.todo.id);
              }),
          title: _hasFocuse
              ? TextField(
                  focusNode: _textFocusNode,
                  controller: _descriptionTextController,
                )
              : Text(widget.todo.description)),
    );
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }
}
