import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final double contentFontSize;
  final double subTitleFontSize;
  final List<Widget> children;

  const Category({
    super.key,
    required this.title,
    required this.titleFontSize,
    required this.contentFontSize,
    required this.subTitleFontSize,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF374D9A),
          ),
        ),
        ...children,
      ],
    );
  }
}