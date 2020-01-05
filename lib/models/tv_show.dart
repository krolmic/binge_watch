import 'package:binge_watch/models/base.dart';

class TVShow extends MovieTVShowBase {
  TVShow({
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
    this.originalName,
    this.name,
    this.originCountry,
    this.firstAirDate,
    this.createdBy,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.seasons,
    this.type,
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

  factory TVShow.fromJson(Map<String, dynamic> json) {
    return TVShow(
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
      homepage: json['homepage'],
      productionCompanies: json['production_companies'],
      status: json['status'],
      originalName: json['original_name'],
      name: json['name'],
      originCountry: json['origin_country'],
      firstAirDate: json.containsKey('first_air_date')
          ? DateTime.parse(json['first_air_date'])
          : null,
      createdBy: json['created_by'],
      inProduction: json['in_production'],
      languages: json['languages'],
      lastAirDate: json.containsKey('last_air_date')
          ? DateTime.parse(json['last_air_date'])
          : null,
      lastEpisodeToAir: json['last_episode_to_air'],
      nextEpisodeToAir: json['next_episode_to_air'],
      networks: json['networks'],
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      seasons: json['seasons'],
      type: json['type'],
    );
  }

  final String originalName;
  final String name;
  final List<String> originCountry;
  final DateTime firstAirDate;
  final List<Map<String, dynamic>> createdBy;
  final bool inProduction;
  final List<String> languages;
  final DateTime lastAirDate;
  final Map<String, dynamic> lastEpisodeToAir;
  final dynamic nextEpisodeToAir;
  final List<Map<String, dynamic>> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<Map<String, dynamic>> seasons;
  final String type;
}
