import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EvenOddApp(),
    );
  }
}

class EvenOddApp extends StatefulWidget {
  @override
  State<EvenOddApp> createState() => _EvenOddAppState();
}

class _EvenOddAppState extends State<EvenOddApp> {
  TextEditingController numberController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Even or Odd Checker"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter a number",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String value = numberController.text;
                int number = int.parse(value);

                if (number % 2 == 0) {
                  result = "The number $number is Even.";
                } else {
                  result = "The number $number is Odd.";
                }
                setState(() {});
              },
              child: Text("Check"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
