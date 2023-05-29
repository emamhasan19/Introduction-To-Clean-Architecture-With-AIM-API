import 'package:clean_api/Source/features/homePage/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
