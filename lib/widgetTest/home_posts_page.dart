import 'package:counter_widget_testing/common/posts_model.dart';
import 'package:flutter/material.dart';

class HomePostsWidgetPage extends StatefulWidget {
  final Future<List<PostsModel>> getPosts;
  const HomePostsWidgetPage({required this.getPosts, super.key});

  @override
  State<HomePostsWidgetPage> createState() => _HomeUserUnitState();
}

class _HomeUserUnitState extends State<HomePostsWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Posts Widget Test'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: widget.getPosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<PostsModel> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),

                  child: Container(
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
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
