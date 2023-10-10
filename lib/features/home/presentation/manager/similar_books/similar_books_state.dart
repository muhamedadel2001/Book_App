part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoadingData extends SimilarBooksState {}
class SimilarBooksSuccessData extends SimilarBooksState {}
class SimilarBooksFailedData extends SimilarBooksState {}
