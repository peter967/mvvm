import 'package:dio/dio.dart';
import 'package:mvvm/model/posts_model.dart';
import 'package:mvvm/repos/posts/posts_repo.dart';
import 'package:mvvm/constants/end_point.dart';

class PostsAPI extends PostsRepo {
  final Dio _dio = Dio();
  @override
  Future<List<PostsModel>> getPosts() async {
    List<PostsModel> posts = [];
    try {
      var response = await _dio.get('$endPoint/posts');
      var list = response.data as List;
      posts = list.map((post) => PostsModel.fromJson(post)).toList();
    } catch (exception) {}

    return posts;
  }

  @override
  Future<PostsModel> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
}
