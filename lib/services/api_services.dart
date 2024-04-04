import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';

class ApiServices {
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=308a395daccf9a50d6701d00e6ea4b3e';
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formjson(movie)).toList();
    } else {
      throw Exception('Something Wrong');
    }
  }

  static const topratedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&api_key=308a395daccf9a50d6701d00e6ea4b3e';
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topratedUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formjson(movie)).toList();
    } else {
      throw Exception('Something Wrong');
    }
  }

  static const upComingMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&api_key=308a395daccf9a50d6701d00e6ea4b3e';
  Future<List<Movie>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(upComingMovieUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formjson(movie)).toList();
    } else {
      throw Exception('Something Wrong');
    }
  }
}
