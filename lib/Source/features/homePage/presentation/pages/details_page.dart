import 'package:clean_api/Source/core/colors.dart';
import 'package:clean_api/Source/features/homePage/data/models/post_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final PostModel postModel;
  const DetailsPage({super.key, required this.postModel});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final postBloc = BlocProvider.of<PostBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary_color,
        title: const Text(
          'AIM API',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Palette.secondary_color,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              color: Palette.secondary_color,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.postModel.title,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Palette.primary_color,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 4,
              color: Palette.primary_color,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.postModel.body,
                  style:
                      const TextStyle(fontSize: 20, color: Palette.white_color),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
