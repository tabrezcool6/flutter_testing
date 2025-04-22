import 'package:counter_widget_testing/common/custom_button.dart';
import 'package:counter_widget_testing/common/services/widgetTest/posts_repository_widget.dart';
import 'package:counter_widget_testing/integratedTest/home_integrated_testing.dart';
import 'package:counter_widget_testing/unitTest/home_counter_page.dart';
import 'package:counter_widget_testing/unitTest/home_posts_page.dart';
import 'package:counter_widget_testing/widgetTest/home_counter_page.dart';
import 'package:counter_widget_testing/widgetTest/home_posts_page.dart';
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
      // home: HomePostsWidgetPage(
      //   getPosts: PostsRepositoryWidgetTest().getPosts(),
      // ),
      home: const Home(),
    );
  }
}

/// UI Pages for References
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
            ///
            /// Unit Test UI
            ///

            /// find unit test for HomeCounterUnit Page in
            /// "lib/unitTest/home_counter_unit_test.dart"
            CustomButton(
              title: 'Counter Unit Test',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeCounterUnitPage(),
                    ),
                  ),
            ),

            /// find unit test for HomePostsUnit Page in
            /// "lib/unitTest/home_posts_unit_test.dart"
            CustomButton(
              title: 'Posts Unit Test',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePostsUnitPage(),
                    ),
                  ),
            ),

            ///
            /// Widget Test UI
            HorizontalDivider(),

            /// find widget test for HomeCounterWidget Page in
            /// "lib/widgetTest/home_counter_widget_test.dart"
            CustomButton(
              title: 'Counter Widget Test',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeCounterWidgetPage(),
                    ),
                  ),
            ),

            /// find widget test for HomePostsWidget Page in
            /// "lib/widgetTest/home_posts_widget_test.dart"
            CustomButton(
              title: 'Posts Widget Test',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => HomePostsWidgetPage(
                            getPosts: PostsRepositoryWidgetTest().getPosts(),
                          ),
                    ),
                  ),
            ),

            ///
            /// INTEGRATION Test UI
            HorizontalDivider(),

            /// find widget test for HomeLoginIntegratedTest Page in
            /// "projectRoot/integration_test/home_login_test.dart"
            CustomButton(
              title: 'Login Integrated Test',
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeLoginIntegratedTest(),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
