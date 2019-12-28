import 'package:binge_watch/models/base.dart';

class Movie extends MovieTVShowBase {
  Movie({
    double popularity,
    int voteCount,
    String posterPath,
    int id,
    String backdropPath,
    String originalLanguage,
    List<int> genreIds,
    double voteAverage,
    String overview,
    this.adult,
    this.originalTitle,
    this.title,
    this.releaseDate,
  }) : super(
          popularity: popularity,
          voteCount: voteCount,
          posterPath: posterPath,
          id: id,
          backdropPath: backdropPath,
          originalLanguage: originalLanguage,
          genreIds: genreIds,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      popularity: json['popularity'],
      voteCount: json['vote_count'],
      posterPath: json['poster_path'],
      id: json['id'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      genreIds: json['genre_ids'],
      voteAverage: json['vote_average'],
      overview: json['overview'],
      adult: json['adult'],
      originalTitle: json['original_title'],
      title: json['title'],
      releaseDate: DateTime.parse(json['release_date']),
    );
  }

  final bool adult;
  final String originalTitle;
  final String title;
  final DateTime releaseDate;
}
