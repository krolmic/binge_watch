import 'dart:convert';

import 'package:http/http.dart';

import 'package:tmdb_api/src/tmdb_api_configuration.dart';
import 'package:tmdb_api/src/tmdb_api_exceptions.dart';

class TMDBApi {
  TMDBApi(this.client, this.apiKey);

  /// http.Client used for the API requests
  final Client client;

  /// TMDB API key
  final String apiKey;

  /// Returns results based on an endpoint path. Pass optional key
  /// [resultsListKey] to cast it's value to a list.
  Future<Map<String, dynamic>> _getResults(String endpointPath,
      [String resultsListKey = '',
      Map<String, String> queryParameters = const <String, String>{}]) async {
    // Prepare Uri and send a GET request
    final Uri discoverUri = Uri.https(
      baseUrl,
      endpointPath,
      <String, String>{'api_key': apiKey, ...queryParameters},
    );
    final Response response = await client.get(discoverUri);

    if (response.statusCode != 200) {
      throw const TMDBApiResponseException(
          'Response status code does not equal 200.');
    }

    // Parse the results
    Map<String, dynamic> movieSearchJson;
    try {
      movieSearchJson = json.decode(utf8.decode(response.bodyBytes));
    } on FormatException {
      throw const TMDBApiResponseException(
          'Response does not contain a valid JSON.');
    }

    if (resultsListKey.isNotEmpty &&
        movieSearchJson.containsKey(resultsListKey)) {
      try {
        movieSearchJson[resultsListKey] =
            List<Map<String, dynamic>>.from(movieSearchJson[resultsListKey]);
      } on TypeError {
        throw TMDBApiResponseException(
            'Failed to create a list from value of $resultsListKey.');
      }
    }

    return movieSearchJson;
  }

  /// Returns movies results based on a list of genres.
  Future<Map<String, dynamic>> getDiscoverMoviesResults(
      {List<int> genres, int page}) async {
    final Map<String, String> queryParameters = <String, String>{};

    if (genres != null) {
      queryParameters['with_genres'] = genres.join(',');
    }
    if (page != null) {
      queryParameters['page'] = page.toString();
    }

    return _getResults(discoverMoviesEndpointPath, 'results', queryParameters);
  }

  /// Returns TV shows results based on a list of genres.
  Future<Map<String, dynamic>> getDiscoverTVShowsResults(
      {List<int> genres, int page}) async {
    final Map<String, String> queryParameters = <String, String>{};

    if (genres != null) {
      queryParameters['with_genres'] = genres.join(',');
    }
    if (page != null) {
      queryParameters['page'] = page.toString();
    }

    return _getResults(discoverTVShowsEndpointPath, 'results', queryParameters);
  }

  /// Returns movie details based on a movie Id.
  Future<Map<String, dynamic>> getMovieDetails(int id) async {
    return _getResults('$movieDetailsEndpointPath${id.toString()}');
  }

  /// Returns movie details based on a TV show Id.
  Future<Map<String, dynamic>> getTVShowDetails(int id) async {
    return _getResults('$tvShowDetailsEndpointPath${id.toString()}');
  }

  /// Returns genre IDs of movies
  Future<Map<String, dynamic>> getListMoviesGenreIDsResults() async {
    return _getResults(listMoviesGenreIDs, 'genres');
  }

  /// Returns genre IDs of TV shows
  Future<Map<String, dynamic>> getListTVShowsGenreIDsResults() async {
    return _getResults(listTVShowsGenreIDs, 'genres');
  }
}
