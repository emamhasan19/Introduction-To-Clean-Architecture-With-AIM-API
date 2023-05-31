// import 'package:clean_api/Source/features/homePage/domain/entities/post_entity.dart';
// import 'package:equatable/equatable.dart';
//
// abstract class PostState extends Equatable {
//   const PostState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class PostInitial extends PostState {}
//
// class PostLoading extends PostState {}
//
// class PostLoaded extends PostState {
//   final List<PostEntity> posts;
//
//   const PostLoaded(this.posts);
//
//   @override
//   List<Object> get props => [posts];
// }
//
// class PostError extends PostState {
//   final String errorMessage;
//
//   const PostError(this.errorMessage);
//
//   @override
//   List<Object> get props => [errorMessage];
// }

import 'package:clean_api/Source/features/homePage/domain/entities/post_entity.dart';
import 'package:equatable/equatable.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostEntity>[],
    this.error = "",
  });

  final PostStatus status;
  final List<PostEntity> posts;
  final String error;

  PostState copyWith({
    PostStatus? status,
    List<PostEntity>? posts,
    String? error,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'PostState { status: $status,  posts: ${posts.length}, error: $error }';
  }

  @override
  List<Object?> get props => [status, posts, error];
}
