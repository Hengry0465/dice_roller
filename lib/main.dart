import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _imgDice = 'assets/images/dice-1.png';

  void _rollDice(){
    int _rnd = Random().nextInt(6)+1;
    setState(() {
      _imgDice = 'assets/images/dice-${_rnd}.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Dice Roller App', style: TextStyle(color: Colors.blue, fontSize:20)
            ),
            SizedBox(height: 50),
            Image.asset(_imgDice,
                width: 100, height: 100, fit: BoxFit.fill),
            SizedBox(height: 50),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            ElevatedButton(onPressed: _rollDice,
                child: Text('Roll', style: TextStyle(color: Colors.blue, fontSize: 25))),
            ElevatedButton(onPressed: (){setState(() {
              _imgDice = 'assets/images/dice-1.png';})
            ;},
              child: Text('Reset', style: TextStyle(color: Colors.red, fontSize: 25)))
            ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
