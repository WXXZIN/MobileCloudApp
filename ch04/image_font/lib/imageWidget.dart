import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget {
  const ImageWidgetApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageWidgetApp();
  }
}

class _ImageWidgetApp extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'image/flutter.png',
                width: 200,
                height: 100,
                fit: BoxFit.fill,
              ),
              const Text(
                '안녕 Flutter',
                style: TextStyle(
                  fontFamily: 'Along',
                  fontSize: 30,
                  color: Colors.deepOrange,
                ),
              ),
              const Text(
                'Hello Flutter',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  color: Colors.deepPurple,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}