import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search.dart';

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

  static const popularUrl =
      'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=308a395daccf9a50d6701d00e6ea4b3e';
  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.formjson(movie)).toList();
    } else {
      throw Exception('Something Wrong');
    }
  }

  // Future<List<SearchModel>> getSearchResults(String name) async {
  //   final searchurl = '/search/multi?query=$name&';
  //   final headers = {
  //     'Authorization':
  //         "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc",
  //     'accept': 'application/json',
  //   };
  //   try {
  //     final response = await http.get(
  //       Uri.parse('https://api.themoviedb.org/3$searchurl${Constants.apiKey}'),
  //       headers: headers,
  //     );

  //     if (response.statusCode == 200) {
  //       final decodedResult = jsonDecode(response.body)['results'] as List?;

  //       if (decodedResult != null) {
  //         final results = decodedResult
  //             .map((result) => SearchModel.fromJson(result))
  //             .toList();
  //         return results;
  //       } else {
  //         // Handle case where 'results' is null
  //         throw Exception("Results are null");
  //       }
  //     } else {
  //       // Handle HTTP error status code
  //       throw Exception("HTTP Error: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     // Handle other exceptions
  //     throw Exception("Error fetching search results: $e");
  //   }
  // }

  Future<List<SearchModel>> getSearchResults(String name) async {
    final searchurl = '/search/multi?query=$name&';
    final headers = {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc",
      'accept': 'application/json',
    };
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3$searchurl${Constants.apiKey}'),
      headers: headers,
    );
    final decodedResult = jsonDecode(response.body)['results'] as List;

    final results =
        decodedResult.map((result) => SearchModel.fromJson(result)).toList();

    return results;
  }
}
