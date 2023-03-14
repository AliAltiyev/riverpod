import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({Key? key}) : super(key: key);

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  final _future = Future.delayed(const Duration(seconds: 2)).then((value) {
    return Random().nextInt(100);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                //For calling method build
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(

            // My future response  from https://www.google.com/
            // Not calls future every time when method build executes if
            // I will not create instance of Future into the Build method.
            future: _future,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {}
              if (snapshot.connectionState == ConnectionState.values) {}
              if (snapshot.connectionState == ConnectionState.waiting) {}
              if (snapshot.connectionState == ConnectionState.done) {}

              if (snapshot.connectionState == ConnectionState.active) {}
              if (snapshot.hasData) {
                return Center(
                  child: Text(snapshot.toString()),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
