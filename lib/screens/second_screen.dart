import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/dio_provider.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(todoFutureProvider(11));
    return Scaffold(
      body: SafeArea(
        child: data.when(
            data: (data) {
              return ReorderableListView(
                  key: UniqueKey(),
                  children: [
                    for (int index = 0; index < 100; index += 1)
                      ListTile(
                          key: Key('$index'),
                          title: Text(
                        data.map((e) => e.title).toString(),
                      ))
                  ],
                  onReorder: (int olditem, int newItem) {
                    print('    Render: ${context.findRenderObject()}');
                  });
            },
            error: (error, stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
