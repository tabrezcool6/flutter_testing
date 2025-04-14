import 'package:counter_widget_testing/common/posts_model.dart';
import 'package:counter_widget_testing/common/services/unitTest/posts_repository_unit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePostsUnitPage extends StatefulWidget {
  const HomePostsUnitPage({super.key});

  @override
  State<HomePostsUnitPage> createState() => _HomeUserUnitState();
}

class _HomeUserUnitState extends State<HomePostsUnitPage> {
  Future<List<PostsModel>> getPosts = PostsRepository(Client()).getPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('User Unit Test'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getPosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<PostsModel> posts = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder:
                    (context, index) => Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Text(posts[index].id.toString()),
                        title: Text(posts[index].title),
                      ),
                    ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the data
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: CircularProgressIndicator());
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          // return Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: ListView.builder(
          //     itemCount: snapshot.data?.length ?? 0,
          //     itemBuilder:
          //         (context, index) => Container(
          //           margin: EdgeInsets.symmetric(vertical: 8),
          //           decoration: BoxDecoration(
          //             border: Border.all(color: Colors.grey, width: 1.0),
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //           child: ListTile(
          //             leading: Text(snapshot.data?[index].id.toString() ?? ''),
          //             title: Text(snapshot.data?[index].title ?? ''),
          //           ),
          //         ),
          //   ),
          // );
        },
      ),
    );
  }
}
