import 'package:flutter/material.dart';

class FutureBuilderExample extends StatelessWidget {
  const FutureBuilderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)).then((value) => 100),
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

              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
