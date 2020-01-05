import 'package:http/http.dart';
import 'package:test/test.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  group('Integration tests', () {
    TMDBApi api;
    Client client;

    setUp(() {
      client = Client();
      api = TMDBApi(client, '8e68bef61fb954fbb58e148283d81f85');
    });

    test('getDiscoverMoviesResults test', () async {
      final Map<String, dynamic> result = await api.getDiscoverMoviesResults();
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);

      final Map<String, dynamic> movieToTest = result['results'][0];
      expect(movieToTest['title'], isA<String>());
      expect(movieToTest['popularity'], isNotNaN);
      expect(movieToTest['vote_count'], isA<int>());
      expect(movieToTest['video'], isA<bool>());
      expect(movieToTest['adult'], isA<bool>());
      expect(movieToTest['original_title'], isA<String>());
      expect(movieToTest['poster_path'], isA<String>());
      expect(movieToTest['release_date'], isA<String>());
      expect(DateTime.parse(movieToTest['release_date']), isNotNull);
      expect(movieToTest['id'], isA<int>());
      expect(movieToTest['backdrop_path'], isA<String>());
      expect(movieToTest['original_language'], isA<String>());
      expect(movieToTest['genre_ids'], isList);
      expect(movieToTest['vote_average'], isNotNaN);
      expect(movieToTest['overview'], isA<String>());
    });

    test('getDiscoverMoviesResults genres test', () async {
      final Map<String, dynamic> result = await api.getDiscoverMoviesResults(
          genres: <int>[movieIdComedy, movieIdAnimation]);
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
    });

    test('getDiscoverMoviesResults genres page test', () async {
      final Map<String, dynamic> result = await api.getDiscoverMoviesResults(
          genres: <int>[movieIdComedy, movieIdAnimation], page: 2);
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
          genres: <int>[tvShowIdComedy, tvShowIdAnimation]);
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);

      final Map<String, dynamic> tvShowToTest = result['results'][0];
      expect(tvShowToTest['original_name'], isA<String>());
      expect(tvShowToTest['genre_ids'], isList);
      expect(tvShowToTest['name'], isA<String>());
      expect(tvShowToTest['popularity'], isNotNaN);
      expect(tvShowToTest['original_name'], isA<String>());
      expect(tvShowToTest['origin_country'], isList);
      expect(tvShowToTest['vote_count'], isA<int>());
      expect(tvShowToTest['first_air_date'], isA<String>());
      expect(DateTime.parse(tvShowToTest['first_air_date']), isNotNull);
      expect(tvShowToTest['backdrop_path'], isA<String>());
      expect(tvShowToTest['original_language'], isA<String>());
      expect(tvShowToTest['id'], isA<int>());
      expect(tvShowToTest['vote_average'], isNotNaN);
      expect(tvShowToTest['overview'], isA<String>());
      expect(tvShowToTest['poster_path'], isA<String>());
    });

    test('getDiscoverTVShowsResults genres page test', () async {
      final Map<String, dynamic> result = await api.getDiscoverTVShowsResults(
          genres: <int>[tvShowIdComedy, tvShowIdAnimation], page: 2);
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

      // Verify data types
      expect(result['title'], isA<String>());
      expect(result['popularity'], isNotNaN);
      expect(result['vote_count'], isA<int>());
      expect(result['video'], isA<bool>());
      expect(result['adult'], isA<bool>());
      expect(result['original_title'], isA<String>());
      expect(result['poster_path'], isA<String>());
      expect(result['release_date'], isA<String>());
      expect(DateTime.parse(result['release_date']), isNotNull);
      expect(result['id'], isA<int>());
      expect(result['backdrop_path'], isA<String>());
      expect(result['original_language'], isA<String>());
      expect(result['genres'], isList);
      expect(result['vote_average'], isNotNaN);
      expect(result['overview'], isA<String>());
      expect(result['budget'], isNotNaN);
      expect(result['homepage'], isA<String>());
      expect(result['tagline'], isA<String>());
      expect(result['production_companies'], isList);
      expect(result['production_countries'], isList);
      expect(result['spoken_languages'], isList);
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

      // Verify data types
      expect(result['original_name'], isA<String>());
      expect(result['genres'], isList);
      expect(result['name'], isA<String>());
      expect(result['popularity'], isNotNaN);
      expect(result['original_name'], isA<String>());
      expect(result['origin_country'], isList);
      expect(result['vote_count'], isA<int>());
      expect(result['first_air_date'], isA<String>());
      expect(DateTime.parse(result['first_air_date']), isNotNull);
      expect(result['last_air_date'], isA<String>());
      expect(DateTime.parse(result['last_air_date']), isNotNull);
      expect(result['backdrop_path'], isA<String>());
      expect(result['original_language'], isA<String>());
      expect(result['id'], isA<int>());
      expect(result['vote_average'], isNotNaN);
      expect(result['overview'], isA<String>());
      expect(result['poster_path'], isA<String>());
      expect(result['production_companies'], isList);
      expect(result['status'], isA<String>());
      expect(result['created_by'], isList);
      expect(result['in_production'], isA<bool>());
      expect(result['languages'], isList);
      expect(result['last_episode_to_air'], isMap);
      expect(result['networks'], isList);
      expect(result['number_of_episodes'], isA<int>());
      expect(result['number_of_seasons'], isA<int>());
      expect(result['type'], isA<String>());
      expect(result['seasons'], isList);
    });

    test('getListMoviesGenreIDsResults test', () async {
      final Map<String, dynamic> result =
          await api.getListMoviesGenreIDsResults();
      expect(result, isMap);
      expect(result['genres'], isList);
      expect(result['genres'], isNotEmpty);

      final List<Map<String, dynamic>> expectedResult = <Map<String, dynamic>>[
        <String, dynamic>{'id': movieIdAction, 'name': 'Action'},
        <String, dynamic>{'id': movieIdAdventure, 'name': 'Adventure'},
        <String, dynamic>{'id': movieIdAnimation, 'name': 'Animation'},
        <String, dynamic>{'id': movieIdComedy, 'name': 'Comedy'},
        <String, dynamic>{'id': movieIdCrime, 'name': 'Crime'},
        <String, dynamic>{'id': movieIdDocumentary, 'name': 'Documentary'},
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
      final Map<String, dynamic> result =
          await api.getListTVShowsGenreIDsResults();
      expect(result, isMap);
      expect(result['genres'], isList);
      expect(result['genres'], isNotEmpty);

      final List<Map<String, dynamic>> expectedResult = <Map<String, dynamic>>[
        <String, dynamic>{
          'id': tvShowIdActionAdventure,
          'name': 'Action & Adventure'
        },
        <String, dynamic>{'id': tvShowIdAnimation, 'name': 'Animation'},
        <String, dynamic>{'id': tvShowIdComedy, 'name': 'Comedy'},
        <String, dynamic>{'id': tvShowIdCrime, 'name': 'Crime'},
        <String, dynamic>{'id': tvShowIdDocumentary, 'name': 'Documentary'},
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
        <String, dynamic>{'id': tvShowIdWarPolitics, 'name': 'War & Politics'},
        <String, dynamic>{'id': tvShowIdWestern, 'name': 'Western'}
      ];

      expect(result['genres'], equals(expectedResult));
    });
  });
}
