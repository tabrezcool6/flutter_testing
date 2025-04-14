import 'package:counter_widget_testing/common/custom_button.dart';
import 'package:counter_widget_testing/common/services/counter.dart';
import 'package:flutter/material.dart';

class HomeCounterWidgetPage extends StatefulWidget {
  const HomeCounterWidgetPage({super.key});

  @override
  State<HomeCounterWidgetPage> createState() => _HomeCounterPageState();
}

class _HomeCounterPageState extends State<HomeCounterWidgetPage> {
  /// creating an instance of the Counter class
  final Counter counter = Counter();

  /// increment function to increment the counter value
  void _incrementCounter() => setState(() => counter.increment());

  /// decrement function to decrement the counter value
  void _decrementCounter() => setState(() => counter.decrement());

  /// increment function to increment the counter value by 2
  void _incrementCounterBy2() => setState(() => counter.incrementBy2());

  /// decrement function to decrement the counter value by 2
  void _decrementCounterBy2() => setState(() => counter.decrementBy2());

  /// reset function to reset the counter value
  void _resetCounter() => setState(() => counter.reset());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Widget Test'),
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

            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  title: '-2',
                  onTap: _decrementCounterBy2,
                  isFullWidth: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomButton(
                    title: 'Reset',
                    onTap: _resetCounter,
                    isFullWidth: false,
                  ),
                ),
                CustomButton(
                  key: const Key('elevIncrementButton'),
                  title: '+2',
                  onTap: _incrementCounterBy2,
                  isFullWidth: false,
                ),
              ],
            ),
          ],
        ),
      ),

      /// floating action button to increment the counter value
      /// when the button is pressed the _incrementCounter function is called
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            SizedBox(height: 14.0),
            FloatingActionButton(
              key: const Key('fabResetButton'),
              onPressed: _resetCounter,
              tooltip: 'Reset',
              child: const Icon(Icons.restore),
            ),
            SizedBox(height: 14.0),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
