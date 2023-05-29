// part of 'post_bloc.dart';
//
// abstract class PostState extends Equatable {
//   const PostState();
// }
//
// class PostInitial extends PostState {
//   @override
//   List<Object> get props => [];
// }

import 'package:clean_api/Source/features/homePage/data/models/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> posts;

  const PostLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostError extends PostState {
  final String errorMessage;

  const PostError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
