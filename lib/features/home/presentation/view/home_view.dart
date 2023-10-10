import 'package:book_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
   // FeaturedBooksCubit.get(context).fetchFeaturedBooks();
    if (kDebugMode) {
      print(FeaturedBooksCubit.get(context).result);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
