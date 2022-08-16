import 'package:flutter/material.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return하는 Widget은 MaterialApp 뿐이지만
    // MaterialApp widget 내에는 AppBar, Container, FloatingActionButton widget이 존재
    // 또한, 이 3개의 widget은 각각 하위 widget을 지님.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Widget"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text("손소독"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => {},
        ),
      ),
    );
  }
}
