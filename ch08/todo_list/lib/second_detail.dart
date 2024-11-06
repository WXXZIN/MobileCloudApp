import 'package:flutter/material.dart';

class SecondDetail extends StatefulWidget {
  const SecondDetail({super.key});

  @override
  State<SecondDetail> createState() => _SecondDetailState();
}

class _SecondDetailState extends State<SecondDetail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('할 일 작성 페이지'),
        backgroundColor: Colors.lightGreen,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                // TextField의 아래쪽 여백 추가
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  // TextField의 외곽선 추가
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '할 일을 입력하세요',
                    // TextField의 내부 Padding
                    contentPadding: EdgeInsets.all(12.0),
                  ),
                )
              ),
              SizedBox(
                // 버튼의 가로 크기를 최대한으로 설정
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(controller.value.text);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,  // 버튼의 글자 색상
                    backgroundColor: Colors.green,  // 배경 색상
                    // 버튼의 내부 Padding(높이)
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      // 버튼의 모서리를 둥글게
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    '할 일 저장하기',
                    style: TextStyle(fontSize: 18.0),
                  )
                ),
              )
            ],
          )
        )
      )
    );
  }
}
