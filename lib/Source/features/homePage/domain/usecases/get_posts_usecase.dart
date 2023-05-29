import 'package:clean_api/Source/features/homePage/domain/entities/post_entity.dart';
import 'package:clean_api/Source/features/homePage/domain/repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository postRepository;

  GetPostsUseCase(this.postRepository);

  Future<List<PostEntity>> execute() {
    return postRepository.getPosts();
  }
}
