// part of 'post_bloc.dart';
//
// abstract class PostEvent extends Equatable {
//   const PostEvent();
// }

import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchPostsEvent extends PostEvent {}
