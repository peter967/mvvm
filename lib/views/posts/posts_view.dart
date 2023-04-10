import 'package:flutter/material.dart';
import 'package:mvvm/view_model/posts_view_model.dart';

import '../../repos/posts/posts_api.dart';

class PostsView extends StatelessWidget {
  PostsView({Key? key}) : super(key: key);
  //dep injection
  var postsViewModel = PostsViewModel(postsRepo: PostsAPI());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: postsViewModel.fetchAllPosts(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var posts = snapShot.data;

              return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(posts![i].title),
                    subtitle: Text(posts[i].body),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
