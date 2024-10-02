import 'package:flutter/material.dart';
import 'package:listview_exam/models/animal.dart';
import 'package:listview_exam/sub/first_page.dart';
import 'package:listview_exam/sub/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// SingleTickerProviderStateMixin을 with로 추가
// 탭을 눌렀을 때 애니메이션 처리를 위해 사용
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Animal> animalList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

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

  // 위젯 상태 관리를 위해 위젯을 끝내주는 함수로 Stateful 마지막에 호출
  // 탭 컨트롤러는 애니메이션을 사용
  // dispose() 함수를 통해 탭 컨트롤러를 해제
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void addAnimal(Animal animal) {
    setState(() {
      animalList.add(animal);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('리스트 예제'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList, onAddAnimal: addAnimal),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(
              icon: Icon(Icons.looks_one, color: Colors.blue),
            ),
            Tab(
              icon: Icon(Icons.looks_two, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
