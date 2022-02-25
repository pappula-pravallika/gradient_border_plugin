import 'package:flutter/material.dart';
import 'package:gradient_border/gradient_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Border'),
        ),
        body: Center(
          child: Column(
            children: [
              GradientBorder(
                 padding: EdgeInsets.all(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red,
                      Colors.green,
                    ],
                  ),
                  child: const Text('Hello world')
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red,
                      Colors.green,
                    ],
                  ),
                ),
                child: const Text('Hello world')
                // height: 50,
              )
            ],
          ),
        )
      ),
    );
  }
}
