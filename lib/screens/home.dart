import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stateManagmentRiverpod/provider/provider_manager.dart';

import '../model/todo.dart';
import '../provider/provider.dart';
import '../widgets/title.dart';
import '../widgets/todo_list_item.dart';
import '../widgets/tooltip.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(toDoListProvider);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          const CustomTitle(),
          TextField(
            decoration: const InputDecoration(labelText: 'Add task'),
            controller: _textController,
            onSubmitted: (value) {
              ref.read(toDoListProvider.notifier).addTodo(value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(child: Text('4 todos')),
              CustomTooltip(message: 'All Todos', buttonText: 'All'),
              CustomTooltip(
                  message: 'Completed Todos', buttonText: 'Completed'),
              CustomTooltip(
                  message: 'Uncompleted Todos', buttonText: 'Uncompleted'),
            ],
          ),
          for (int i = 0; i < todos.length; i++)
            Dismissible(
                key: UniqueKey(),
                onDismissed: (_) {
                  ref.read(toDoListProvider.notifier).remove(todos[i]);
                },
                child: TodoListItem(todo: todos[i]))
        ],
      ),
    );
  }
}
