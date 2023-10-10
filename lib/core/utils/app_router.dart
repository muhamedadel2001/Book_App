import 'package:book_app/features/home/presentation/view/home_view.dart';
import 'package:book_app/features/search/presentation/views/search_view.dart';
import 'package:book_app/features/splash/presentation/views/splash_view.dart';
import 'package:book_app/screens.dart' as screens;
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/book_details.dart';

class AppRouter {
  static final AppRouter router = AppRouter();
  late Widget startScreeen;
  Route? onGenerateRoute(RouteSettings routeSettings) {
    startScreeen = const SplashView();
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreeen);
      case screens.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case screens.bookDetails:
        final routesArgs = routeSettings.arguments as Map<String, dynamic>;
        final title = routesArgs['title'].toString();
        final author = routesArgs['author'].toString();
        final imageUrl = routesArgs['imageUrl'].toString();
        final price = routesArgs['price'].toString();
        final url = routesArgs['url'].toString();
        // final author = routeSettings.arguments as String;
        //final imagUrl = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BookDetails(
                  title: title,
                  author: author,
                  imageUrl: imageUrl,
                  price: price,
                  url: url,
                ));
      case screens.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchView());
    }
    return null;
  }
}
