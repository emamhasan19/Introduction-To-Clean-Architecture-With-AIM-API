import 'dart:convert';

import 'package:clean_api/Source/features/homePage/data/models/post_model.dart';
import 'package:clean_api/Source/features/homePage/domain/entities/post_entity.dart';
import 'package:http/http.dart' as http;

abstract class PostDataSource {
  Future<List<PostEntity>> getPosts();
}

class PostDataSourceImpl implements PostDataSource {
  @override
  Future<List<PostEntity>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<PostEntity> posts = jsonData
          .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
