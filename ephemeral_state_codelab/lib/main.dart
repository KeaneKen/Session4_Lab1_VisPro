import 'package:flutter/material.dart';

void main() => runApp(MyEphemeralApp());

class MyEphemeralApp extends StatelessWidget {
  const MyEphemeralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ephemeral State Example'),
        ),
        body: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Counter Value: $_counter'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
} 