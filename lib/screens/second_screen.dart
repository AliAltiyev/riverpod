import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/dio_provider.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(todoFutureProvider);
    return Scaffold(
      body: SafeArea(
        child: data.when(
            data: (data) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(title: Text(data[index].title));
                },
                itemCount: data.length,
              );
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
