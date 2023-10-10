part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoadingData extends FeaturedBooksState {}

class FeaturedBooksGetDataSuccess extends FeaturedBooksState {}

class FeaturedBooksGetDataFailed extends FeaturedBooksState {}
