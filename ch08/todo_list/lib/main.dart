import 'package:flutter/material.dart';
import 'package:todo_list/sub_detail.dart';
import 'package:todo_list/second_detail.dart';
import 'package:todo_list/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SubDetail(),
        '/second': (context) => const SecondDetail(),
        '/third': (context) => const ThirdPage(),
      },
    );
  }
}
