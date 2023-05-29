import 'package:clean_api/Source/features/homePage/data/models/post_model.dart';
import 'package:clean_api/Source/features/homePage/domain/repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository postRepository;

  GetPostsUseCase(this.postRepository);

  Future<List<PostModel>> execute() {
    return postRepository.getPosts();
  }
}
