import 'package:clean_api/Source/core/colors.dart';
import 'package:clean_api/Source/core/routes/routing_constants.dart';
import 'package:clean_api/Source/features/homePage/presentation/bloc/post_bloc.dart';
import 'package:clean_api/Source/features/homePage/presentation/bloc/post_event.dart';
import 'package:clean_api/Source/features/homePage/presentation/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary_color,
        title: const Center(
          child: Text(
            'AIM API',
            style: TextStyle(color: Palette.secondary_color),
          ),
        ),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, detailsPageRoute,
                        arguments: post);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 2.0),
                    child: Card(
                      color: index % 2 == 0
                          ? Palette.secondary_color
                          : Palette.primary_color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Palette.primary_color
                                : Palette.secondary_color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 40,
                          width: 40,
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: index % 2 == 0
                                    ? Palette.secondary_color
                                    : Palette.primary_color,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          (post.title).substring(0, 12),
                          style: TextStyle(
                            fontSize: 20,
                            color: index % 2 == 0
                                ? Palette.primary_color
                                : Palette.secondary_color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${(post.body).substring(0, 10)}...',
                          style: TextStyle(
                            fontSize: 16,
                            color: index % 2 == 0
                                ? Palette.primary_color
                                : Palette.secondary_color,
                          ),
                        ),
                        trailing: Icon(
                          index % 2 == 0 ? Icons.api : Icons.exit_to_app,
                          size: 30,
                          color: index % 2 == 0
                              ? Palette.primary_color
                              : Palette.secondary_color,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No data found.'),
            );
          }
        },
      ),
    );
  }
}
