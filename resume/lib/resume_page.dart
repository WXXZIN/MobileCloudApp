import 'package:flutter/material.dart';

import 'package:resume/widgets/body.dart';
import 'package:resume/widgets/header.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final double sidePadding = isMobile ? 16.0 : 32.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: isMobile ? double.infinity : 1000,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  Body(),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}
