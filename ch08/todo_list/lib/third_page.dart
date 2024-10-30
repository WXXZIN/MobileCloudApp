import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 내용 페이지'),
        backgroundColor: Colors.pinkAccent,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Text(
            args,
            style: const TextStyle(fontSize: 20.0), 
          )
        )
      )
    );
  }
}
