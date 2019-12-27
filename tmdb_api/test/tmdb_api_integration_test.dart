import 'package:http/http.dart';
import 'package:test/test.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  group('Integration tests', () {
    TMDBApi api;
    Client client;

    setUp(() {
      client = Client();
      api = TMDBApi(client, "8e68bef61fb954fbb58e148283d81f85");
    });

    test('getDiscoverMoviesResults test', () async {
      final Map<String, dynamic> result = await api.getDiscoverMoviesResults();
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
      expect(result['results'][0].containsKey('title'), isTrue);
    });

    test('getDiscoverMoviesResults genres test', () async {
      final Map<String, dynamic> result = await api.getDiscoverMoviesResults(
          genres: [movieIdComedy, movieIdAnimation]);
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
    });

    test('getDiscoverMoviesResults genres page test', () async {
      final Map<String, dynamic> result = await api.getDiscoverMoviesResults(
          genres: [movieIdComedy, movieIdAnimation],
          page: 2);
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
    });

    test('getDiscoverTVShowsResults test', () async {
      final Map<String, dynamic> result = await api.getDiscoverTVShowsResults();
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
    });

    test('getDiscoverTVShowsResults genres test', () async {
      final Map<String, dynamic> result = await api.getDiscoverTVShowsResults(
          genres: [tvShowIdComedy, tvShowIdAnimation]);
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
    });

    test('getDiscoverTVShowsResults genres page test', () async {
      final Map<String, dynamic> result = await api.getDiscoverTVShowsResults(
          genres: [tvShowIdComedy, tvShowIdAnimation],
          page: 2);
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
    });

    test('getMovieDetails test', () async {
      // Get a movie Id
      final Map<String, dynamic> discoverMoviesResults =
          await api.getDiscoverMoviesResults();
      expect(discoverMoviesResults, isMap);
      expect(discoverMoviesResults['results'], isList);
      expect(discoverMoviesResults['results'], isNotEmpty);
      final int movieTestId = discoverMoviesResults['results'][0]['id'];

      // Get and verify movie details
      final Map<String, dynamic> result =
          await api.getMovieDetails(movieTestId);
      expect(result, isMap);
      expect(result['id'], equals(movieTestId));
    });

    test('getTVShowDetails test', () async {
      // Get a TV show Id
      final Map<String, dynamic> discoverTVShowsResults =
          await api.getDiscoverTVShowsResults();
      expect(discoverTVShowsResults, isMap);
      expect(discoverTVShowsResults['results'], isList);
      expect(discoverTVShowsResults['results'], isNotEmpty);
      final int tvShowTestId = discoverTVShowsResults['results'][0]['id'];

      // Get and verify TV show details
      final Map<String, dynamic> result =
          await api.getTVShowDetails(tvShowTestId);
      expect(result, isMap);
      expect(result['id'], equals(tvShowTestId));
    });

    test('getListMoviesGenreIDsResults test', () async {
      final Map<String, dynamic> result =
          await api.getListMoviesGenreIDsResults();
      expect(result, isMap);
      expect(result['genres'], isList);
      expect(result['genres'], isNotEmpty);

      final List<Map<String, dynamic>> expectedResult = <Map<String, dynamic>>[
        <String, dynamic>{'id': movieIdAction, 'name': 'Action'},
        <String, dynamic>{
          'id': movieIdAdventure,
          'name': 'Adventure'
        },
        <String, dynamic>{
          'id': movieIdAnimation,
          'name': 'Animation'
        },
        <String, dynamic>{'id': movieIdComedy, 'name': 'Comedy'},
        <String, dynamic>{'id': movieIdCrime, 'name': 'Crime'},
        <String, dynamic>{
          'id': movieIdDocumentary,
          'name': 'Documentary'
        },
        <String, dynamic>{'id': movieIdDrama, 'name': 'Drama'},
        <String, dynamic>{'id': movieIdFamily, 'name': 'Family'},
        <String, dynamic>{'id': movieIdFantasy, 'name': 'Fantasy'},
        <String, dynamic>{'id': movieIdHistory, 'name': 'History'},
        <String, dynamic>{'id': movieIdHorror, 'name': 'Horror'},
        <String, dynamic>{'id': movieIdMusic, 'name': 'Music'},
        <String, dynamic>{'id': movieIdMystery, 'name': 'Mystery'},
        <String, dynamic>{'id': movieIdRomance, 'name': 'Romance'},
        <String, dynamic>{
          'id': movieIdScienceFiction,
          'name': 'Science Fiction'
        },
        <String, dynamic>{'id': movieIdTVMovie, 'name': 'TV Movie'},
        <String, dynamic>{'id': movieIdThriller, 'name': 'Thriller'},
        <String, dynamic>{'id': movieIdWar, 'name': 'War'},
        <String, dynamic>{'id': movieIdWestern, 'name': 'Western'}
      ];

      expect(result['genres'], equals(expectedResult));
    });

    test('getListTVShowsGenreIDsResults test', () async {
      Map<String, dynamic> result = await api.getListTVShowsGenreIDsResults();
      expect(result, isMap);
      expect(result['genres'], isList);
      expect(result['genres'], isNotEmpty);

      List<Map<String, dynamic>> expectedResult = <Map<String, dynamic>>[
        <String, dynamic>{
          'id': tvShowIdActionAdventure,
          'name': 'Action & Adventure'
        },
        <String, dynamic>{
          'id': tvShowIdAnimation,
          'name': 'Animation'
        },
        <String, dynamic>{'id': tvShowIdComedy, 'name': 'Comedy'},
        <String, dynamic>{'id': tvShowIdCrime, 'name': 'Crime'},
        <String, dynamic>{
          'id': tvShowIdDocumentary,
          'name': 'Documentary'
        },
        <String, dynamic>{'id': tvShowIdDrama, 'name': 'Drama'},
        <String, dynamic>{'id': tvShowIdFamily, 'name': 'Family'},
        <String, dynamic>{'id': tvShowIdKids, 'name': 'Kids'},
        <String, dynamic>{'id': tvShowIdMystery, 'name': 'Mystery'},
        <String, dynamic>{'id': tvShowIdNews, 'name': 'News'},
        <String, dynamic>{'id': tvShowIdReality, 'name': 'Reality'},
        <String, dynamic>{
          'id': tvShowIdSciFiFantasy,
          'name': 'Sci-Fi & Fantasy'
        },
        <String, dynamic>{'id': tvShowIdSoap, 'name': 'Soap'},
        <String, dynamic>{'id': tvShowIdTalk, 'name': 'Talk'},
        <String, dynamic>{
          'id': tvShowIdWarPolitics,
          'name': 'War & Politics'
        },
        <String, dynamic>{'id': tvShowIdWestern, 'name': 'Western'}
      ];

      expect(result['genres'], equals(expectedResult));
    });
  });
}
