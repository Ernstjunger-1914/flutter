import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Page Route",
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/about': (context) => SubScreen(),
    },
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Launch Screen"),
          onPressed: () {
            // named route를 통해 다음 화면으로 전환
            Navigator.pushNamed(context, '/about');
          },
        ),
      ),
    );
  }
}

class SubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // 현 route 스택을 제거하여 main page로 돌아간다.
            Navigator.pop(context);
          },
          child: Text("뒤로가기"),
        ),
      ),
    );
  }
}
