import 'package:flutter/material.dart';
import 'package:riverpod/widgets/title.dart';
import 'package:riverpod/widgets/tooltip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          const CustomTitle(),
          TextField(
            decoration: const InputDecoration(labelText: 'Add task'),
            controller: _textController,
            onSubmitted: (value) {
              //TODO do not forget
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
          )
        ],
      ),
    );
  }
}
