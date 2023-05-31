// import 'package:equatable/equatable.dart';
//
// abstract class PostEvent extends Equatable {
//   const PostEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class FetchPostsEvent extends PostEvent {}

//using bloc library structure

import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchPostsEvent extends PostEvent {
  const FetchPostsEvent();
}
