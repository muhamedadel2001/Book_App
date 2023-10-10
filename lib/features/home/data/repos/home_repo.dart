import 'package:book_app/features/home/data/models/book_model.dart';

abstract class HomeRepo{
  Future<List<dynamic>> fetchNewestBooks();
  Future<List<dynamic>> fetchFeaturedBooks();
  Future<List<dynamic>> fetchSimilarBooks();
  Future<List<dynamic>> fetchSearchBooksBooks();
}