import 'package:mvvm/model/posts_model.dart';

abstract class PostsRepo {
  Future<List<PostsModel>> getPosts();
  Future<PostsModel> getPostById(int id);
}
