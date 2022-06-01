import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var title = "Web Image";
    var imageUrl =
        "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif";

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        // URL 이미지로 작업하려면 Image.network 생성자를 사용해야
        body: Image.network(imageUrl),
      ),
    );
  }
}
