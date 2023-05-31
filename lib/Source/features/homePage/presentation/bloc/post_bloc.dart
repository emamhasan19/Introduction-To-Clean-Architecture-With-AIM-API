// import 'package:clean_api/Source/features/homePage/domain/usecases/get_posts_usecase.dart';
// import 'package:clean_api/Source/features/homePage/presentation/bloc/post_event.dart';
// import 'package:clean_api/Source/features/homePage/presentation/bloc/post_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class PostBloc extends Bloc<PostEvent, PostState> {
//   final GetPostsUseCase getPostsUseCase;
//
//   PostBloc({required this.getPostsUseCase}) : super(PostInitial()) {
//     {
//       on<FetchPostsEvent>((event, emit) async {
//         try {
//           // Show loading state
//           emit(PostLoading());
//
//           // Make the API call to fetch posts
//           final posts = await getPostsUseCase.execute();
//
//           // Update the state with the fetched posts
//           emit(PostLoaded(posts));
//         } catch (error) {
//           // Handle error state
//           emit(PostError('Failed to fetch posts: $error'));
//         }
//       });
//     }
//   }
// }

import 'package:clean_api/Source/features/homePage/domain/usecases/get_posts_usecase.dart';
import 'package:clean_api/Source/features/homePage/presentation/bloc/post_event.dart';
import 'package:clean_api/Source/features/homePage/presentation/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase getPostsUseCase;

  PostBloc({required this.getPostsUseCase})
      : super(const PostState(status: PostStatus.initial)) {
    {
      on<FetchPostsEvent>((event, emit) async {
        try {
          // Show loading state
          emit(state.copyWith(status: PostStatus.initial));

          // Make the API call to fetch posts
          final posts = await getPostsUseCase.execute();

          // Update the state with the fetched posts
          emit(state.copyWith(
            status: PostStatus.success,
            posts: posts, // Modify this according to your logic
          ));
        } catch (error) {
          // Handle error state
          emit(state.copyWith(status: PostStatus.failure, error: '$error'));
        }
      });
    }
  }

  // @override
  // Stream<PostState> mapEventToState(PostEvent event) async* {
  //   if (event is FetchPostsEvent) {
  //     yield state.copyWith(status: PostStatus.initial);
  //     try {
  //       final posts = await getPostsUseCase.execute();
  //       yield state.copyWith(
  //         status: PostStatus.success,
  //         posts: posts,
  //         hasReachedMax: true, // Modify this according to your logic
  //       );
  //     } catch (e) {
  //       yield state.copyWith(status: PostStatus.failure);
  //     }
  //   }
  // }
}
