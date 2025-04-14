import 'dart:convert';

import 'package:counter_widget_testing/common/posts_model.dart';
import 'package:http/http.dart' as http;

/// PostsRepository for Widget Testing
/// PostsRepository class to fetch the posts from the API
class PostsRepositoryWidgetTest {
  /// getPosts function to fetch the posts from the API
  /// here we are using the http client to make the GET request to the API
  Future<List<PostsModel>> getPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=1'),
    );

    /// if the response is of type 200 then we are parsing the response body
    /// and returning the List<PostsModel> object
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final parsedData =
          jsonData.map((elem) => PostsModel.fromJson(elem)).toList();
      return parsedData;
    }

    /// if the response is not of type 200 then we are throwing an exception
    /// this will help us to test the error response in the unit tests
    throw Exception('Some Error Occurred');
  }
}
