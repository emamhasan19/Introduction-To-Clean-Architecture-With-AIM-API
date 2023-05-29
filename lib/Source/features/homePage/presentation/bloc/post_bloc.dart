import 'package:clean_api/Source/features/homePage/domain/usecases/fetch_posts_usecase.dart';
import 'package:clean_api/Source/features/homePage/presentation/bloc/post_event.dart';
import 'package:clean_api/Source/features/homePage/presentation/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase getPostsUseCase;

  PostBloc({required this.getPostsUseCase}) : super(PostInitial()) {
    {
      on<FetchPostsEvent>((event, emit) async {
        try {
          // Show loading state
          emit(PostLoading());

          // Make the API call to fetch posts
          final posts = await getPostsUseCase.execute();

          // Update the state with the fetched posts
          emit(PostLoaded(posts));
        } catch (error) {
          // Handle error state
          emit(PostError('Failed to fetch posts: $error'));
        }
      });
    }
  }

  // @override
  // Stream<PostState> mapEventToState(PostEvent event) async* {
  //   if (event is FetchPostsEvent) {
  //     yield PostLoading();
  //     try {
  //       final posts = await getPostsUseCase.execute();
  //       yield PostLoaded(posts);
  //     } catch (e) {
  //       yield PostError('Failed to fetch posts.');
  //     }
  //   }
  // }
}

// import 'package:bloc/bloc.dart';
// import 'package:clean_api/Source/features/homePage/domain/repositories/post_repository.dart';
// import 'package:clean_api/Source/features/homePage/presentation/bloc/post_event.dart';
// import 'package:clean_api/Source/features/homePage/presentation/bloc/post_state.dart';
//
// class PostBloc extends Bloc<PostEvent, PostState> {
//   final PostRepository postRepository;
//
//   PostBloc({required this.postRepository}) : super(PostInitial());
//
//   @override
//   Stream<PostState> mapEventToState(PostEvent event) async* {
//     if (event is FetchPostsEvent) {
//       yield PostLoading();
//       try {
//         final posts = await postRepository.getPosts();
//         yield PostLoaded(posts);
//       } catch (e) {
//         yield PostError('Failed to fetch posts.');
//       }
//     }
//   }
// }
