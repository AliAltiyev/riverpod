import 'package:riverpod/riverpod.dart';
import 'package:stateManagmentRiverpod/provider/provider_manager.dart';
import 'package:uuid/uuid.dart';

import '../model/todo.dart';

//Provides all list Items
final toDoListProvider = StateNotifierProvider<ProviderManager, List<Todo>>(
        (ref) =>
        ProviderManager([
          Todo(id: const Uuid().v4(), description: 'Go To Gym'),
          Todo(id: const Uuid().v4(), description: 'School'),
          Todo(id: const Uuid().v4(), description: 'Shopping Time'),
          Todo(id: const Uuid().v4(), description: 'Udemy Time'),
        ]));

//UnCompletedList Items
final unCompletedListItems = Provider((ref) {
  final unCompletedListItems = ref
      .watch(toDoListProvider)
      .where((element) => !element.isCompleted)
      .length;
  return unCompletedListItems;
});

//CompletedList Items
final completedListItems = Provider<int>((ref) {
  final completedListItems = ref
      .watch(toDoListProvider)
      .where((element) => element.isCompleted)
      .length;
  return completedListItems;
});

//All list items length
final allItemsLength = Provider<int>((ref) {
  final allItems = ref
      .watch(toDoListProvider)
      .length;
  return allItems;
});

//Provide TodoItem
final todoItemProvider = Provider<Todo>((ref) {
  throw UnimplementedError();
});
