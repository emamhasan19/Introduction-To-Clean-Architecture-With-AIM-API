import 'package:clean_api/Source/core/routes/routes.dart';
import 'package:clean_api/Source/features/homePage/data/repositories/post_repository_impl.dart';
import 'package:clean_api/Source/features/homePage/data/sources/post_data_source.dart';
import 'package:clean_api/Source/features/homePage/domain/repositories/post_repository.dart';
import 'package:clean_api/Source/features/homePage/domain/usecases/get_posts_usecase.dart';
import 'package:clean_api/Source/features/homePage/presentation/bloc/post_bloc.dart';
import 'package:clean_api/Source/features/homePage/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final PostDataSource postDataSource = PostDataSourceImpl();
  final PostRepository postRepository = PostRepositoryImpl(postDataSource);
  final GetPostsUseCase getPostsUseCase = GetPostsUseCase(postRepository);
  final PostBloc postBloc = PostBloc(getPostsUseCase: getPostsUseCase);

  runApp(MyApp(postBloc: postBloc));
}

class MyApp extends StatelessWidget {
  final PostBloc postBloc;

  const MyApp({super.key, required this.postBloc});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => postBloc,
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: generateRoute,
        debugShowCheckedModeBanner: false,
        home: PostPage(),
      ),
    );
  }
}
