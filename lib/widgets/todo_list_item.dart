import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stateManagmentRiverpod/provider/provider.dart';

class TodoListItem extends ConsumerStatefulWidget {
  const TodoListItem({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _TodoListItemState();
}

class _TodoListItemState extends ConsumerState<TodoListItem> {
  bool _hasFocuse = false;
  final _descriptionTextController = TextEditingController();
  final _textFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(todoItemProvider);

    return Focus(
      onFocusChange: (isFocused) {
        if (!isFocused) {
          setState(() {
            _hasFocuse = false;
            ref
                .read(toDoListProvider.notifier)
                .editTodo(item.id, _descriptionTextController.text);
          });
        }
      },
      child: ListTile(
          onTap: () {
            setState(() {
              _hasFocuse = true;
              _textFocusNode.requestFocus();
              _descriptionTextController.text = item.description;
            });
          },
          leading: Checkbox(
              value: item.isCompleted,
              onChanged: (bool? value) {
                ref.read(toDoListProvider.notifier).toggle(item.id);
              }),
          title: _hasFocuse
              ? TextField(
                  focusNode: _textFocusNode,
                  controller: _descriptionTextController,
                )
              : Text(item.description)),
    );
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }
}
