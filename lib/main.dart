import 'package:counter_widget_testing/common/custom_button.dart';
import 'package:counter_widget_testing/unitTest/home_counter_unit.dart';
import 'package:counter_widget_testing/unitTest/home_posts_unit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}

/// page where i have added the buttons to navigate to the unit test pages
/// so that you can have better understanding of the unit test with UI
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Testing'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// find unit test test for HomeCounterUnit Page in
            /// "lib/unitTest/home_counter_unit_test.dart"
            CustomButton(
              title: 'Counter Unit Test',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeCounterUnit()),
                  ),
            ),

            /// find unit test test for HomePostsUnit Page in
            /// "lib/unitTest/home_posts_unit_test.dart"
            CustomButton(
              title: 'Posts Unit Test',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePostsUnit()),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
