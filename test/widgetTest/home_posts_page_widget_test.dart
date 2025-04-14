// Importing necessary packages
import 'package:counter_widget_testing/common/posts_model.dart';
import 'package:counter_widget_testing/widgetTest/home_posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Grouping related widget tests for better organization
  group('Home Posts Page Widget Test - ', () {
    /// Test case: Verifying the behavior of the HomePostsWidgetPage
    testWidgets(
      'given the HomePostsWidgetPage when PostsRepositoryWidgetTest is passed then List of Posts to be displayed with id, and title.',
      (tester) async {
        /// Mock data: A list of posts to simulate API response
        /// you can also creaate this mock data using MockTail or Mockito package
        /// which I have shown in the unit test, check the unit test for more details
        final List<PostsModel> posts = [
          PostsModel(userId: 1, id: 1, title: 'Test Title 1'),
          PostsModel(userId: 1, id: 2, title: 'Test Title 2'),
        ];

        /// Mock function to simulate fetching posts
        Future<List<PostsModel>> getPosts() async => posts;

        /// Pumping the widget into the widget tree for testing and
        /// Passing the mock getPosts function
        await tester.pumpWidget(
          MaterialApp(home: HomePostsWidgetPage(getPosts: getPosts())),
        );

        /// Verifying that a CircularProgressIndicator is displayed initially
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        /// Triggering a frame to allow the widget to rebuild after fetching posts
        await tester.pump();

        /// Verifying that a ListView is displayed after posts are loaded
        expect(find.byType(ListView), findsOneWidget);

        /// Verifying that the correct number of ListTile widgets are displayed
        expect(find.byType(ListTile), findsNWidgets(posts.length));

        /// Iterating through the mock posts to verify their content is displayed
        for (final post in posts) {
          /// Verifying that the post ID is displayed
          expect(find.text(post.id.toString()), findsOneWidget);

          /// Verifying that the post title is displayed
          expect(find.text(post.title), findsOneWidget);
        }
      },
    );
  });
}


/*

import 'package:counter_widget_testing/common/posts_model.dart';
import 'package:counter_widget_testing/widgetTest/home_posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home Posts Page Widget Test - ', () {
    testWidgets(
      'given the HomePostsWidgetPage when PostsRepositoryWidgetTest is passed then List of Posts to be displayed with id, and title.',
      (tester) async {
        final List<PostsModel> posts = [
          PostsModel(userId: 1, id: 1, title: 'Test Title 1'),
          PostsModel(userId: 1, id: 2, title: 'Test Title 2'),
        ];

        Future<List<PostsModel>> getPosts() async => posts;

        await tester.pumpWidget(
          MaterialApp(home: HomePostsWidgetPage(getPosts: getPosts())),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pump();

        expect(find.byType(ListView), findsOneWidget);

        expect(find.byType(ListTile), findsNWidgets(posts.length));

        for (final post in posts) {
          expect(find.text(post.id.toString()), findsOneWidget);
          expect(find.text(post.title), findsOneWidget);
        }
      },
    );
  });
}

 */