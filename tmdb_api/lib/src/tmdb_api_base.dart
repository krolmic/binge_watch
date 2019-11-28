import 'dart:convert';

import 'package:http/http.dart';

import 'package:tmdb_api/src/tmdb_api_configuration.dart';

class TMDBApi {
  TMDBApi(this.client, this.apiKey);

  /// http.Client used for the API requests
  final Client client;

  /// TMDB API key
  final String apiKey;

  /// Returns results based on an endpoint path and a list of genres
  Future<Map<String, dynamic>> _getResults(String endpointPath,
      [String resultsListKey = '',
      Map<String, String> queryParameters = const {}]) async {
    // Prepare Uri and send a GET request
    final Uri discoverUri = Uri.https(
      TMDBApiConfiguration.baseUrl,
      endpointPath,
      {'api_key': apiKey, ...queryParameters},
    );
    final Response response = await client.get(discoverUri);

    // Parse the results
    Map<String, dynamic> movieSearchJson =
        json.decode(utf8.decode(response.bodyBytes));

    if (resultsListKey.isNotEmpty) {
      movieSearchJson[resultsListKey] =
          (movieSearchJson[resultsListKey] as List)
              .cast<Map<String, dynamic>>();
    }

    return movieSearchJson;
  }

  /// Returns movies results based on a list of genres.
  Future<Map<String, dynamic>> getDiscoverMoviesResults(
      List<int> genres) async {
    return _getResults(TMDBApiConfiguration.discoverMoviesEndpointPath,
        'results', {'with_genres': genres.join(',')});
  }

  /// Returns TV shows results based on a list of genres.
  Future<Map<String, dynamic>> getDiscoverTVShowsResults(
      List<int> genres) async {
    return _getResults(TMDBApiConfiguration.discoverTVShowsEndpointPath,
        'results', {'with_genres': genres.join(',')});
  }

  /// Returns genre IDs of movies
  Future<Map<String, dynamic>> getListMoviesGenreIDsResults() async {
    return _getResults(TMDBApiConfiguration.listMoviesGenreIDs, 'genres');
  }

  /// Returns genre IDs of TV shows
  Future<Map<String, dynamic>> getListTVShowsGenreIDsResults() async {
    return _getResults(TMDBApiConfiguration.listTVShowsGenreIDs, 'genres');
  }
}
