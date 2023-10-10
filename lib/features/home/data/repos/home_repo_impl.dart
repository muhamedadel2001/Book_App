import 'dart:io';
import 'package:book_app/constants.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/foundation.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  List<dynamic> featuredBooksList = [];
  List<dynamic> newestBooksList = [];
  List<dynamic> similarBooksList = [];
  List<dynamic> searchBooksList = [];
  @override
  Future<List<dynamic>> fetchNewestBooks() async {
    try {
      var data = await apiService.getData(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject=computer scince&Sorting=newest');

      for (var item in data) {
        newestBooksList.add(item);
      }
      return newestBooksList;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      return newestBooksList;
    }
  }

  @override
  Future<List<dynamic>> fetchFeaturedBooks() async {
    // List<BookModel> list = [];

    try {
      var data = await apiService.getData(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject=Programming&startIndex=0&maxResults=40');
      for (var item in data) {
        featuredBooksList.add(item);
      }

      return featuredBooksList;
    } on SocketException {
      print('enternet error');
      return featuredBooksList;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      return featuredBooksList;
    }
  }

  @override
  Future<List> fetchSimilarBooks() async {
    try {
      var data = await apiService.getData(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject=computer scince&Sorting=relevance');
      for (var item in data) {
        similarBooksList.add(item);
      }

      return similarBooksList;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      return similarBooksList;
    }
  }

  @override
  Future<List> fetchSearchBooksBooks() async {
    try {
      var data = await apiService.getData(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject=Programming');
      searchBooksList.clear();
      for (var item in data) {
        if (item['volumeInfo']['title'] == textEditingController.text) {
          searchBooksList.add(item);
        }
      }
      return searchBooksList;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      return searchBooksList;
    }
  }
}
