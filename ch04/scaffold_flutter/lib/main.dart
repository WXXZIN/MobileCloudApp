import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('디자인 구조'),
          backgroundColor: Colors.orange,
        ),
        body: Container(),
        bottomNavigationBar: const BottomAppBar(
          child: Text('choi'),
        ),
      )
    );
  }
}
