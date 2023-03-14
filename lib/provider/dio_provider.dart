import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stateManagmentRiverpod/model/todo_api.model.dart';
import 'package:stateManagmentRiverpod/provider/provider.dart';

final todoFutureProvider =
    FutureProvider.family<List<TodoApiModel>, int>((ref, id) async {
  final dio = ref.watch(httpProvider);
  final result = await dio.get('todos', queryParameters: {'id': id});
  List<Map<String, dynamic>> dataList = List.from(result.data);
  List<TodoApiModel> todos =
      dataList.map((element) => TodoApiModel.fromMap(element)).toList();

  debugPrint(todos.toString());
  return todos;
});
