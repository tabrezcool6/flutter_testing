import 'package:counter_widget_testing/common/services/counter.dart';
import 'package:flutter/material.dart';

class HomeCounterUnit extends StatefulWidget {
  const HomeCounterUnit({super.key});

  @override
  State<HomeCounterUnit> createState() => _HomeCounterUnitState();
}

class _HomeCounterUnitState extends State<HomeCounterUnit> {
  /// creating an instance of the Counter class
  final Counter counter = Counter();

  /// increment function to increment the counter value
  void _incrementCounter() {
    setState(() {
      counter.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Unit Test'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            /// displaying the counter value here
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      /// floating action button to increment the counter value
      /// when the button is pressed the _incrementCounter function is called
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
