import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  final int age;

  const Profile(this.name, this.age, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$name\n $age살');
  }
}
