import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:randomizer/result_page.dart';

int previousValue = 0;

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({Key? key, required this.title}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int min = -1, max = -1;

  @override
  Widget build(BuildContext context) {
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
            Text(
              'Previous number: $previousValue',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _inputField('Minimal value', true),
            _inputField('Maximal value', false),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => setState(() {
                  _findOut();
                }),
                child: const Text(
                  'Generate random number',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  SizedBox _inputField(String inputName, bool isMin) {
    return SizedBox(
      width: 250,
      height: 100,
      child: TextField(
        onChanged: ((value) {
          int number = int.tryParse(value) ?? -1;
          isMin ? _setMin(number) : _setMax(number);
        }),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
        maxLength: 11,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: inputName,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          counterStyle: const TextStyle(
            color: Colors.white,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _setMin(value) {
    min = value;
  }

  _setMax(value) {
    max = value;
  }

  _findOut() {
    if (min == -1 || max == -1) {
      return;
    } else if (min > max) {
      return;
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    title: widget.title,
                    min: min,
                    max: max,
                  )));
    }
  }
}
