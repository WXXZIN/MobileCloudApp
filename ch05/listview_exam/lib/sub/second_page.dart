import 'package:flutter/material.dart';
import 'package:listview_exam/models/animal.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  final Function(Animal) onAddAnimal;

  const SecondPage({
    required this.list, 
    required this.onAddAnimal,
    super.key
  });
  
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _nameController = TextEditingController();
  int? _radioValue = 0;
  bool? _flyExist = false;
  String? _imagePath;
  
  _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  _getKind(int? radioValue) {
    switch (radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  const Text('양서류'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  const Text('파충류'),
                  Radio(
                    value: 2,
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  const Text('포유류'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('날 수 있나요?'),
                  Checkbox(
                    value: _flyExist,
                    onChanged: (bool? check) {
                      setState(() {
                        _flyExist = check;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/cow.png';
                      },
                      child: Image.asset('image/cow.png', width: 80)
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/pig.png';
                      },
                      child: Image.asset('image/pig.png', width: 80)
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/bee.png';
                      },
                      child: Image.asset('image/bee.png', width: 80)
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/cat.png';
                      },
                      child: Image.asset('image/cat.png', width: 80)
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/fox.png';
                      },
                      child: Image.asset('image/fox.png', width: 80)
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = 'image/monkey.png';
                      },
                      child: Image.asset('image/monkey.png', width: 80)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  var animal = Animal(
                    animalName: _nameController.value.text,
                    kind: _getKind(_radioValue),
                    imagePath: _imagePath,
                    flyExist: _flyExist
                  );
                  AlertDialog dialog = AlertDialog(
                    title: const Text('동물 추가하기'),
                    content: Text(
                      '이 동물은 ${animal.animalName}입니다. '
                      '또 동물의 종류는 ${animal.kind}입니다.\n 이 동물을 추가하시겠습니까?',
                      style: const TextStyle(fontSize: 30.0),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          widget.onAddAnimal(animal);
                          Navigator.of(context).pop();
                        },
                        child: const Text('예'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('아니요'),
                      )
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog
                  );
                },
                child: const Text('동물 추가하기'),
              )
            ],
          )
        )
      )
    );
  }
}
