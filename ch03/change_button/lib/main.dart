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
  String text = 'hello';
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '버튼을 눌러 글자 바꾸기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                text = switchValue ? 'hello' : 'flutter';
                _color = switchValue ? Colors.blue : Colors.green;
                switchValue = !switchValue;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _color,
            ),
            child: Text(text),
          )
        )
      )
    );
  }
}
