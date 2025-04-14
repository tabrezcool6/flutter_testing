import 'package:counter_widget_testing/common/posts_model.dart';
import 'package:counter_widget_testing/common/services/unitTest/posts_repository_unit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

// creating a mock class for the HTTP client, this will be used to mock the HTTP requests
// and responses in the unit tests. this will help us to test the PostsRepository class
// without making actual HTTP requests by comparing the response type mock data to actual API data
class MockHTTPClient extends Mock implements Client {}

void main() {
  // declaring class of type postsRepository
  // and MockHTTPClient
  late PostsRepository userRepository;
  late MockHTTPClient mockHTTPClient;
  late Uri getPostsUrl;

  // initalizing the postsRepository class
  // and the mockHTTPClient class
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = PostsRepository(mockHTTPClient);
    getPostsUrl = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts?userId=1',
    );
  });

  /// grouping all the tests related to home posts class
  group('Home Posts Unit Test - ', () {
    /// testing the getPosts function for Success response i.e status code 200
    test(
      'given userRepository class when getPosts Function is called and status code is 200 then userModel must be returned',
      () async {
        /// mocking the HTTP client and the response for the getPosts function
        /// this will help us to test the getPosts function for success i.e 200
        /// without making actual HTTP requests and to test the response of the getPosts function
        when(() => mockHTTPClient.get(getPostsUrl)).thenAnswer(
          (invocation) async => Response('''
          [
            {
              "userId": 1,
              "id": 1,
              "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
            },
            {
              "userId": 1,
              "id": 2,
              "title": "qui est esse"
            }
          ]
          ''', 200),
        );

        /// calling the getPosts function and checking the response for success type
        /// if the response is of type List<PostsModel> then the test will pass
        /// if the response is not of type List<PostsModel> then the test will fail
        final posts = await userRepository.getPosts();
        expect(posts, isA<List<PostsModel>>());
      },
    );

    // testing the getPosts function for Failure response i.e status code is other than 200
    test(
      'given userRepository class when getPosts Function is called and status code is other than 200 then excetion must be thrown',
      () async {
        when(() => mockHTTPClient.get(getPostsUrl)).thenAnswer(
          (invocation) async => Response('Some Error Occurred...', 400),
        );

        /// calling the getPosts function and checking the response for exception
        /// if the response is of type Exception then the test will pass
        final posts = userRepository.getPosts();
        expect(posts, throwsException);
      },
    );

    ///
  });
}
