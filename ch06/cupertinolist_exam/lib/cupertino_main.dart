import 'package:flutter/cupertino.dart';
import 'package:cupertinolist_exam/models/animal.dart';
import 'package:cupertinolist_exam/sub/cupertino_first_page.dart';
import 'package:cupertinolist_exam/sub/cupertino_second_page.dart';

class CupertinoMain extends StatefulWidget {
  const CupertinoMain({super.key});

  @override
  State<CupertinoMain> createState() => _CupertinoMainState();
}

class _CupertinoMainState extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;

  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    
    tabBar = CupertinoTabBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home)
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.add)
        )
      ]
    );

    animalList.add(Animal(
      animalName: '벌',
      kind: '곤충',
      imagePath: 'image/bee.png',
      flyExist: true,
    ));
    animalList.add(Animal(
      animalName: '고양이',
      kind: '포유류',
      imagePath: 'image/cat.png',
    ));
    animalList.add(Animal(
      animalName: '젖소',
      kind: '포유류',
      imagePath: 'image/cow.png',
    ));
    animalList.add(Animal(
      animalName: '개',
      kind: '포유류',
      imagePath: 'image/dog.png',
    ));
    animalList.add(Animal(
      animalName: '여우',
      kind: '포유류',
      imagePath: 'image/fox.png',
    ));
    animalList.add(Animal(
      animalName: '원숭이',
      kind: '영장류',
      imagePath: 'image/monkey.png',
    ));
    animalList.add(Animal(
      animalName: '돼지',
      kind: '포유류',
      imagePath: 'image/pig.png',
    ));
    animalList.add(Animal(
      animalName: '늑대',
      kind: '포유류',
      imagePath: 'image/wolf.png',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabBar!, 
        tabBuilder: (context, value) {
          if (value == 0) {
            return CupertinoFirstPage(
              animalList: animalList
            );
          } else {
            return CupertinoSecondPage(
              animalList: animalList
            );
          }
        }
      )
    );
  }
}
