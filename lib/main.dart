import 'package:flutter/material.dart';
import 'package:randomizer/main_page.dart';

main() => runApp(const MyApp());

const title = 'Randomizer';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MainPage(title: title),
    );
  }
}
