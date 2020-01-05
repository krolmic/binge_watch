abstract class MovieTVShowBase {
  MovieTVShowBase({
    this.popularity,
    this.voteCount,
    this.posterPath,
    this.id,
    this.backdropPath,
    this.originalLanguage,
    this.genreIds,
    this.voteAverage,
    this.overview,
    this.homepage,
    this.productionCompanies,
    this.status,
  });

  final double popularity;
  final int voteCount;
  final String posterPath;
  final int id;
  final String backdropPath;
  final String originalLanguage;
  final List<int> genreIds;
  final double voteAverage;
  final String overview;
  final String homepage;
  final List<Map<String, dynamic>> productionCompanies;
  final String status;
}
