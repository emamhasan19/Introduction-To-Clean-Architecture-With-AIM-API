import 'package:clean_api/Source/core/routes/routing_constants.dart';
import 'package:clean_api/Source/features/homePage/data/models/post_model.dart';
import 'package:clean_api/Source/features/homePage/presentation/pages/details_page.dart';
import 'package:clean_api/Source/features/homePage/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case postPageRoute:
      return MaterialPageRoute(builder: (context) => PostPage());

    case detailsPageRoute:
      return MaterialPageRoute(
        builder: (context) => DetailsPage(
          postModel: settings.arguments as PostModel,
        ),
      );

    default:
      return null;
  }
}
