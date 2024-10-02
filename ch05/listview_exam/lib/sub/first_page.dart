import 'package:flutter/material.dart';
import 'package:listview_exam/models/animal.dart';

class FirstPage extends StatelessWidget {
  final List<Animal> list;
  
  const FirstPage({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  AlertDialog dialog = AlertDialog(
                    content: Text(
                      '${list[position].animalName}은 ${list[position].kind}입니다.',
                      style: const TextStyle(fontSize: 30.0),
                    ),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog
                  );
                },
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        list[position].imagePath!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(list[position].animalName!),
                    ],
                  )
                ),
              );
            },
            itemCount: list.length,
          )
        )
      )
    );
  }
}
