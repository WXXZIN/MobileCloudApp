import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  State<WidgetApp> createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  final List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = List.empty(growable: true);
  String? _buttonText;

  var sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Example'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '결과 : $sum',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber
                  ),
                  onPressed: () {
                    setState(() {
                      var value1Int = value1.value.text.isNotEmpty ? double.parse(value1.value.text) : 0.0;
                      var value2Int = value2.value.text.isNotEmpty ? double.parse(value2.value.text) : 0.0;
                      dynamic result;

                      if (_buttonText == '더하기') {
                        result = value1Int + value2Int;
                      } else if (_buttonText == '빼기') {
                        result = value1Int - value2Int;
                      } else if (_buttonText == '곱하기') {
                        result = value1Int * value2Int;
                      } else if (_buttonText == '나누기') {
                        result = value1Int / value2Int;

                        if (result.isInfinite) {
                          result = '0으로 나눌 수 없습니다.';
                        }
                      }
                      sum = result.toString();

                      if (value1.value.text.isEmpty) {
                        value1.text = '0.0';
                      }
                      if (value2.value.text.isEmpty) {
                        value2.text = '0.0';
                      }
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.add),
                      Text(_buttonText!)
                    ],
                  ),
                ),
              ),  
              Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButton(
                  items: _dropDownMenuItems, 
                  onChanged: (String? value) {
                    setState(() {
                      _buttonText = value;
                    });
                  }, 
                  value: _buttonText,
                )
              )
            ]
          )
        )
      )
    );
  }
}
