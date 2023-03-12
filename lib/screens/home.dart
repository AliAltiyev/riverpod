import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          const Toolbar(),
          for (int i = 0; i < todos.length; i++)
            Dismissible(
                key: UniqueKey(),
                onDismissed: (_) {
                  ref.read(toDoListProvider.notifier).remove(todos[i]);
                },
                child: ProviderScope(
                    overrides: [todoItemProvider.overrideWithValue(todos[i])],
                    child: const TodoListItem())),
          ElevatedButton(
              onPressed: () {}, child: const Text('Get data from internet'))
        ],
      ),
    );
  }
}

class Toolbar extends ConsumerWidget {
  const Toolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listLength = ref.watch(allItemsLength);
    debugPrint('All items length $listLength');

    final completedItems = ref.watch(completedListItems);
    debugPrint('Completed items length $completedItems');

    final uncompletedItems = ref.watch(unCompletedListItems);
    debugPrint('UnCompleted items length $uncompletedItems');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(listLength.toString())),
        CustomTooltip(message: 'All Todos $listLength', buttonText: 'All'),
        CustomTooltip(
            message: completedItems.toString(), buttonText: 'Completed'),
        CustomTooltip(
            message: uncompletedItems.toString(), buttonText: 'Uncompleted'),
      ],
    );
  }
}
