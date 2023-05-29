import 'package:clean_api/Source/features/homePage/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getPosts();
}
