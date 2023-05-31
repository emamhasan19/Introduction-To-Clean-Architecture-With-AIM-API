import 'package:clean_api/Source/features/homePage/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) : super(id: id, userId: userId, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      title: json['title'] ?? "No Title",
      body: json['body'] ?? "No Body",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}

// import 'package:equatable/equatable.dart';
//
// class PostModel extends Equatable {
//   final int userId;
//   final int id;
//   final String title;
//   final String body;
//
//   const PostModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });
//
//   factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );
//
//   @override
//   List<Object?> get props => [userId, id, title, body];
// }
