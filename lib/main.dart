import 'package:bloc/bloc.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/boloc_observer.dart';
import 'package:book_app/core/utils/service_locater.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/manager/newest_books/newest_cubit.dart';
import 'package:book_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:book_app/features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'constants.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setup();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                ..fetchFeaturedBooks()),
          BlocProvider(
              create: (context) =>
                  NewestCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks()),
          BlocProvider(
              create: (context) =>
                  SimilarBooksCubit(getIt.get<HomeRepoImpl>())..similarBooks()),
          BlocProvider(
              create: (context) =>
              SearchCubit(getIt.get<HomeRepoImpl>()))
        ],
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.router.onGenerateRoute,
        ),
      );
    });
  }
}
