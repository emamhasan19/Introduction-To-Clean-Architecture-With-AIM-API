import 'package:clean_api/Source/features/homePage/data/sources/post_data_source.dart';
import 'package:clean_api/Source/features/homePage/domain/entities/post_entity.dart';
import 'package:clean_api/Source/features/homePage/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource postDataSource;

  PostRepositoryImpl(this.postDataSource);

  @override
  Future<List<PostEntity>> getPosts() {
    return postDataSource.getPosts();
  }
}
