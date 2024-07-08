import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyState extends ChangeNotifier {
  var x = 0.0;
  var y = 0.0;
  void yenile() {
    Random rd = Random();
    x = rd.nextDouble() * 2 - 1;
    y = rd.nextDouble() * 2 - 1;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyState>();
    return Scaffold(
      body: Align(
        alignment: Alignment(state.x, state.y),
        child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,

              color: Colors.red,
            ),
            child: MouseRegion(
            onEnter: (event) {
              state.yenile();
            },),
          ),
        ),
    );
  }
}
