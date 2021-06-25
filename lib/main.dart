import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tashizan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '足し算'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int rightNum = 0;
  int leftNum = 0;
  int result = 0;
  bool isShowResult = false;
  var random = new math.Random();

  void _createSum() {
    setState(() {
      isShowResult = false;
      result = random.nextInt(11) + 1; // 1 ~ 10
      rightNum = random.nextInt(result - 1) + 1; // 1 ~ result
      leftNum = result - rightNum;
    });
  }

  void _showResult() {
    setState(() {
      isShowResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$rightNum',
                  style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                ),
                Container(
                  color: Colors.grey,
                  width: 30,
                ),
                Text(
                  '+',
                  style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                ),
                Container(
                  color: Colors.grey,
                  width: 30,
                ),
                Text(
                  '$leftNum',
                  style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      _showResult();
                    },
                    child: Text(
                      'こたえ',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                  (isShowResult)
                      ? Text(
                          '$result',
                          style: TextStyle(
                              fontSize: 100, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          '',
                          style: TextStyle(
                              fontSize: 100, fontWeight: FontWeight.bold),
                        ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _createSum();
              },
              child: Text(
                'つぎへ',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
