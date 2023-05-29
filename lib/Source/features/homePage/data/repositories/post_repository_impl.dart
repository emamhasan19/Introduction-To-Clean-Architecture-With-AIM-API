import 'package:clean_api/Source/features/homePage/data/models/post_model.dart';
import 'package:clean_api/Source/features/homePage/data/sources/post_data_source.dart';
import 'package:clean_api/Source/features/homePage/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource postDataSource;

  PostRepositoryImpl(this.postDataSource);

  @override
  Future<List<PostModel>> getPosts() {
    return postDataSource.getPosts();
  }
}
