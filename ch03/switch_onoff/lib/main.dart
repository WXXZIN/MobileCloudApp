import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '스위치로 화면 갱신',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: switchValue ? Colors.cyan : Colors.red,
        body: Center(
          child: Switch(
            value: switchValue, 
            onChanged: (value) {
              setState(() {
                print(value);
                switchValue = value;
              });
            }
          )
        )
      )
    );
  }
}
