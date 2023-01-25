import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/api.dart';
import 'package:movies_app/models/movies.dart';

class Repository {
  static Future<List<Movie>> getNowShowingMovies() async {
    final dio = Dio();
    final String apiKey = dotenv.get('API_KEY', fallback: 'Not found');
    try {
      final response = await dio.get(Api.getNowShowing, queryParameters: {
        'api_key': apiKey,
      });
      final data = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      print('Success');
      return data;
    } on DioError catch (err) {
      throw err;
    }
  }

  static Future<List<Movie>> getAnimationMovies() async {
    final dio = Dio();
    final String apiKey = dotenv.get('API_KEY', fallback: 'Not found');
    try {
      final response = await dio.get(Api.getAnimation, queryParameters: {
        'api_key': apiKey,
        'with_genres': 16,
      });
      final data = (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList();
      print('Hello World');
      print(response.data);
      return data;
    } on DioError catch (err) {
      throw err;
    }
  }
}
