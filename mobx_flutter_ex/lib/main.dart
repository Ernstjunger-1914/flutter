import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'store/counter.dart';

// store 초기화
final counter = Counter();

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Mobx"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("버튼을 누른 횟수: "),
            // observer에서 wrapping하면 counter.value로 변경된 부분이 렌더링됨.
            Observer(
              builder: (_) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            )
          ],
        ),
      ),
      // FloatingActionButton widget 클릭 시, counter.increment action을 호출
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: "증가",
        child: const Icon(Icons.add),
      ),
    ));
  }
}
