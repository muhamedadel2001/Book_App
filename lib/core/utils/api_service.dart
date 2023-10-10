import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService(this.dio);

  Future<List<dynamic>> getData({required String endPoint}) async {
    var response = await dio.get( '$_baseUrl$endPoint',);
    return response.data['items'];
  }
}
