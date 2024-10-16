import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertinolist_exam/models/animal.dart';

class CupertinoFirstPage extends StatelessWidget {
  final List<Animal> animalList;

  const CupertinoFirstPage({super.key, required this.animalList});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {},
        ),
        middle: const Text('동물 리스트'),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showCupertinoDialog(
                // 외부를 터치해도 닫히지 않도록 설정
                barrierDismissible: false,
                context: context, 
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text('동물 정보'),
                    content: Text(
                      '${animalList[index].animalName}은(는) ${animalList[index].kind}입니다.',
                      style: const TextStyle(fontSize: 18)
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('확인'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ]
                  );
                }
              );
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 100,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        animalList[index].imagePath!,
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                      Text(animalList[index].animalName!),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: CupertinoColors.black
                  )
                ],
              ),
            ),
            
          );
        },
        itemCount: animalList.length,
      )
    );
  }
}