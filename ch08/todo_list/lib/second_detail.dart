import 'package:flutter/material.dart';

class SecondDetail extends StatefulWidget {
  const SecondDetail({super.key});

  @override
  State<SecondDetail> createState() => _SecondDetailState();
}

class _SecondDetailState extends State<SecondDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.lightGreen,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/third');
            }, 
            child: const Text('세 번째 페이지로 이동하기')
          )
        )
      )
    );
  }
}
