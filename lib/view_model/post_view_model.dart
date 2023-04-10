// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mvvm/model/posts_model.dart';

class PostViewModel {
  PostsModel? postsModel;
  PostViewModel({this.postsModel});
  get id => postsModel?.id;
  get userId => postsModel?.userId;
  get title => postsModel?.title;
  get body => postsModel?.body;
}
