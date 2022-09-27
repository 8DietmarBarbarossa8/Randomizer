import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:randomizer/main_page.dart';

class ResultPage extends StatefulWidget {
  final String title;
  final int min, max;
  const ResultPage(
      {Key? key, required this.title, required this.min, required this.max})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    previousValue = _random(widget.min, widget.max);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The result is',
            style: TextStyle(
              color: Colors.white,
              fontSize: 46,
            ),
          ),
          const SizedBox(height: 30,),
          Text(
            '$previousValue',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 56,
            ),
          ),
        ],
      )),
    );
  }

  int _random(int min, int max) => Random().nextInt(max - min + 1) + min;
}
