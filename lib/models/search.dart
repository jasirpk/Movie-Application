import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/series.dart';

class SearchModel {
  Movie? movie;
  Series? series;

  SearchModel({this.movie, this.series});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('media_type')) {
      if (json['media_type'] == 'movie') {
        return SearchModel(
            movie: Movie(
                title: json['title'],
                backDropPath: json['backdrop_path'],
                oringinalTitl: json['original_title'],
                overView: json['overview'],
                posterPath: json['poster_path'],
                releaseDate: json['release_date'],
                voteAverage: json['vote_average']));
      } else if (json['media_type'] == 'tv') {
        return SearchModel(
          series: Series(
            name: json['name'] ?? '',
            posterImage: json['poster_path'] ?? '',
            overview: json['overview'] ?? '',
            coverImage: json['backdrop_path'] ?? '',
            popularity: json['popularity']?.toDouble() ?? 0.0,
            firstAirDate: json['first_air_date'] ?? '',
          ),
        );
      }
    }
    return SearchModel(); // Return empty SearchModel for any other cases
  }
}
