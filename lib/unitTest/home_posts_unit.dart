import 'package:counter_widget_testing/common/posts_model.dart';
import 'package:counter_widget_testing/common/services/posts_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePostsUnit extends StatefulWidget {
  const HomePostsUnit({super.key});

  @override
  State<HomePostsUnit> createState() => _HomeUserUnitState();
}

class _HomeUserUnitState extends State<HomePostsUnit> {
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder:
                  (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Text(snapshot.data?[index].id.toString() ?? ''),
                      title: Text(snapshot.data?[index].title ?? ''),
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
