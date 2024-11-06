import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html; // dart:html 패키지 가져오기

class SubDetail extends StatefulWidget {
  const SubDetail({super.key});

  @override
  State<SubDetail> createState() => _SubDetailState();
}

class _SubDetailState extends State<SubDetail> {
  List<String> todoList = []; // 할 일 목록을 저장할 리스트

  @override
  void initState() {
    super.initState();
    _loadTodoList(); // 앱 시작 시 할 일 목록을 불러옴
  }

  // 로컬 저장소에서 할 일 목록을 불러오는 메소드
  void _loadTodoList() {
    // 로컬 저장소에서 데이터 불러오기
    String? savedList = html.window.localStorage['todoList'];
    if (savedList != null) {
      setState(() {
        // JSON 형식으로 저장된 데이터를 List<String>으로 변환
        // todoList = List<String>.from(html.window.localStorage['todoList']!.toString().split(','));
        todoList = savedList.split(',');
      });
    }
  }

  // 할 일 목록을 로컬 저장소에 저장하는 메소드
  void _saveTodoList() {
    // 리스트를 문자열로 변환하여 로컬 저장소에 저장
    html.window.localStorage['todoList'] = todoList.join(',');
  }

  void _deleteTodoItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });

    _saveTodoList();  // 삭제된 할 일 목록을 저장
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘 할 일'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(
            height: 55.0,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                title: Text(
                  todoList[index],
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deleteTodoItem(index);
                  },
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/third', arguments: todoList[index]);
                },
              )
            ),
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);  // + 버튼 누르면 할 일 추가 페이지로 이동
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // 할 일 추가를 위한 네비게이션 메소드
  void _addNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/second');

    if (result != null) {
      setState(() {
        todoList.add(result as String);
      });

      _saveTodoList();  // 업데이트 된 할 일 목록을 저장
    }
  }
}
