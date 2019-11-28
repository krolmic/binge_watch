class TMDBApiConfiguration {
  // General configuration
  static final String baseUrl = 'api.themoviedb.org';
  static final String apiVersion = '3';

  // Endpoint URLs
  static final String discoverMoviesEndpointPath =
      '${apiVersion}/discover/movie';
  static final String discoverTVShowsEndpointPath = '${apiVersion}/discover/tv';
  static final String listMoviesGenreIDs = '${apiVersion}/genre/movie/list';
  static final String listTVShowsGenreIDs = '${apiVersion}/genre/tv/list';
}

class TMDBApiGenreIDs {
  static final int action = 28;
  static final int adventure = 12;
  static final int animation = 16;
  static final int comedy = 35;
  static final int crime = 80;
  static final int documentary = 99;
  static final int drama = 18;
  static final int family = 10751;
  static final int fantasy = 14;
  static final int history = 36;
  static final int horror = 27;
  static final int music = 10402;
  static final int mystery = 9648;
  static final int romance = 10749;
  static final int scienceFiction = 878;
  static final int TVMovie = 10770;
  static final int thriller = 53;
  static final int war = 10752;
  static final int western = 37;
}
