import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  group('Integration tests', () {
    TMDBApi api;
    Client client;

    setUp(() {
      client = Client();
      api = TMDBApi(client, "8e68bef61fb954fbb58e148283d81f85");
    });

    test('getDiscoverMoviesResults test', () async {
      Map<String, dynamic> result = await api.getDiscoverMoviesResults(
          [TMDBApiGenreIDs.comedy, TMDBApiGenreIDs.animation]);
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
    });

    test('getDiscoverTVShowsResults test', () async {
      Map<String, dynamic> result = await api.getDiscoverTVShowsResults(
          [TMDBApiGenreIDs.action, TMDBApiGenreIDs.drama]);
      expect(result, isMap);
      expect(result['results'], isList);
      expect(result['results'], isNotEmpty);
    });

    test('getListMoviesGenreIDsResults test', () async {
      Map<String, dynamic> result = await api.getListMoviesGenreIDsResults();
      expect(result, isMap);
      expect(result['genres'], isList);
      expect(result['genres'], isNotEmpty);
    });

    test('getListTVShowsGenreIDsResults test', () async {
      Map<String, dynamic> result = await api.getListTVShowsGenreIDsResults();
      expect(result, isMap);
      expect(result['genres'], isList);
      expect(result['genres'], isNotEmpty);
    });
  });
}
