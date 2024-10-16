import 'package:flutter/cupertino.dart';
import 'package:cupertinolist_exam/models/animal.dart';

class CupertinoSecondPage extends StatefulWidget {
  final List<Animal>? animalList;

  const CupertinoSecondPage({super.key, required this.animalList});

  @override
  State<CupertinoSecondPage> createState() => _CupertinoSecondPageState();
}

class _CupertinoSecondPageState extends State<CupertinoSecondPage> {
  TextEditingController? _textController;
  int _kindChoice = 0;
  bool _flyExist = false;
  String? _imagePath;

  Map<int, Widget> segmentWidgets = {
    0: const SizedBox(
      width: 80,
      child: Text(
        '양서류',
        textAlign: TextAlign.center,
      ),
    ),
    1: const SizedBox(
      width: 80,
      child: Text(
        '포유류',
        textAlign: TextAlign.center,
      ),
    ),
    2: const SizedBox(
      width: 80,
      child: Text(
        '파충류',
        textAlign: TextAlign.center,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('동물 추가'),
      ),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: CupertinoTextField(
                  controller: _textController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
              ),
              CupertinoSegmentedControl(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                groupValue: _kindChoice,
                children: segmentWidgets, 
                onValueChanged: (int value) {
                  setState(() {
                    _kindChoice = value;
                  });
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('날개가 존재합니까?'),
                  CupertinoSwitch(
                    value: _flyExist,
                    onChanged: (value) {
                      setState(() {
                        _flyExist = value;
                      });
                    }
                  )
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/cow.png';
                      },
                      child: Image.asset(
                        'image/cow.png',
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/pig.png';
                      },
                      child: Image.asset(
                        'image/pig.png',
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/bee.png';
                      },
                      child: Image.asset(
                        'image/bee.png',
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/cat.png';
                      },
                      child: Image.asset(
                        'image/cat.png',
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/fox.png';
                      },
                      child: Image.asset(
                        'image/fox.png',
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/monkey.png';
                      },
                      child: Image.asset(
                        'image/monkey.png',
                        width: 80,
                      ),
                    ),
                  ],
                )
              ),
              CupertinoButton(
                child: const Text('동물 추가하기'),
                onPressed: () {
                  widget.animalList?.add(Animal(
                    animalName: _textController?.text,
                    kind: getKind(_kindChoice),
                    imagePath: _imagePath,
                    flyExist: _flyExist)
                  );
                },
              )
            ],
          ),
        ),
      )
    );
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '포유류';
      case 2:
        return '파충류';
    }
  }
}