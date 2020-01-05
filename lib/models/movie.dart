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
    String homepage,
    List<Map<String, dynamic>> productionCompanies,
    String status,
    this.adult,
    this.originalTitle,
    this.title,
    this.releaseDate,
    this.belongsToCollection,
    this.budget,
    this.imdbId,
    this.productionCountries,
    this.spokenLanguages,
    this.tagLine,
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
          homepage: homepage,
          productionCompanies: productionCompanies,
          status: status,
        );

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      popularity:
          json.containsKey('popularity') ? json['popularity'].toDouble() : null,
      voteCount: json['vote_count'],
      posterPath: json['poster_path'],
      id: json['id'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      genreIds: json.containsKey('genre_ids')
          ? json['genre_ids']
          : json.containsKey('genres')
              ? List<int>.from(json['genres'].map((dynamic e) => e['id']))
              : null,
      voteAverage: json.containsKey('vote_average')
          ? json['vote_average'].toDouble()
          : null,
      overview: json['overview'],
      adult: json['adult'],
      originalTitle: json['original_title'],
      title: json['title'],
      releaseDate: json.containsKey('release_date')
          ? DateTime.parse(json['release_date'])
          : null,
      belongsToCollection: json['belongs_to_collection'],
      budget: json.containsKey('budget') ? json['budget'].toDouble() : null,
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      productionCompanies: json['production_companies'],
      productionCountries: json['production_countries'],
      spokenLanguages: json['spoken_languages'],
      status: json['status'],
      tagLine: json['tagline'],
    );
  }

  final bool adult;
  final String originalTitle;
  final String title;
  final DateTime releaseDate;
  final Map<String, dynamic> belongsToCollection;
  final double budget;
  final String imdbId;
  final List<Map<String, dynamic>> productionCountries;
  final List<Map<String, dynamic>> spokenLanguages;
  final String tagLine;
}
