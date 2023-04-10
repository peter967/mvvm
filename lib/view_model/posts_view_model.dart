// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mvvm/model/posts_model.dart';
import 'package:mvvm/repos/posts/posts_repo.dart';

import 'post_view_model.dart';

class PostsViewModel {
  final String title = "All Posts";
  PostsRepo? postsRepo;
  PostsViewModel({this.postsRepo});

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostsModel> list = await postsRepo!.getPosts();
    return list.map((post) => PostViewModel(postsModel: post)).toList();
  }
}
