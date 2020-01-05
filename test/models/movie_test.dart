import 'package:test/test.dart';

import 'package:binge_watch/models/movie.dart';

void main() {
  group('Model Movie tests', () {
    final Map<String, dynamic> validDiscoverMoviesData = <String, dynamic>{
      'popularity': 409.554,
      'vote_count': 485,
      'video': false,
      'poster_path': '/qdfARIhgpgZOBh3vfNhWS4hmSo3.jpg',
      'id': 330457,
      'adult': false,
      'backdrop_path': '/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg',
      'original_language': 'en',
      'original_title': 'Frozen II',
      'genre_ids': <int>[12, 16, 35, 10402, 10751],
      'title': 'Frozen II',
      'vote_average': 7.1,
      'overview':
          'Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.',
      'release_date': '2019-11-20'
    };

    final Map<String, dynamic> validMovieDetailsData = <String, dynamic>{
      'adult': false,
      'backdrop_path': '/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg',
      'belongs_to_collection': <String, dynamic>{
        'id': 386382,
        'name': 'Frozen Collection',
        'poster_path': '/rpoXnE9UzCbjmINhxIi8bZF557B.jpg',
        'backdrop_path': '/vZiqhw6oFoMlHSneIdVip9rRou2.jpg'
      },
      'budget': 0,
      'genres': <Map<String, dynamic>>[
        <String, dynamic>{'id': 16, 'name': 'Animation'},
        <String, dynamic>{'id': 10751, 'name': 'Family'},
        <String, dynamic>{'id': 10402, 'name': 'Music'},
        <String, dynamic>{'id': 12, 'name': 'Adventure'}
      ],
      'homepage': 'https://movies.disney.com/frozen-2',
      'id': 330457,
      'imdb_id': 'tt4520988',
      'original_language': 'en',
      'original_title': 'Frozen II',
      'overview':
          'Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.',
      'popularity': 174.616,
      'poster_path': '/pjeMs3yqRmFL3giJy4PMXWZTTPa.jpg',
      'production_companies': <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 6125,
          'logo_path': '/tVPmo07IHhBs4HuilrcV0yujsZ9.png',
          'name': 'Walt Disney Animation Studios',
          'origin_country': 'US'
        },
        <String, dynamic>{
          'id': 2,
          'logo_path': '/wdrCwmRnLFJhEoH8GSfymY85KHT.png',
          'name': 'Walt Disney Pictures',
          'origin_country': 'US'
        }
      ],
      'production_countries': <Map<String, dynamic>>[
        <String, dynamic>{
          'iso_3166_1': 'US',
          'name': 'United States of America'
        }
      ],
      'release_date': '2019-11-20',
      'revenue': 1041424032,
      'runtime': 104,
      'spoken_languages': <Map<String, dynamic>>[
        <String, dynamic>{'iso_639_1': 'en', 'name': 'English'}
      ],
      'status': 'Released',
      'tagline': 'The past is not what it seems.',
      'title': 'Frozen II',
      'video': false,
      'vote_average': 7.0,
      'vote_count': 1459
    };

    test('Movie.fromJson valid movies discover data test', () {
      final Movie testMovie = Movie.fromJson(validDiscoverMoviesData);
      expect(testMovie.releaseDate, equals(DateTime(2019, 11, 20)));
    });

    test('Movie.fromJson no title movies discover data test', () {
      final Map<String, dynamic> data =
          Map<String, dynamic>.from(validDiscoverMoviesData);
      data.remove('title');

      final Movie testMovie = Movie.fromJson(data);
      expect(testMovie.title, isNull);
    });

    test('Movie.fromJson valid movie details data test', () {
      final Movie testMovie = Movie.fromJson(validMovieDetailsData);
      expect(testMovie.genreIds, equals(<int>[16, 10751, 10402, 12]));
      expect(testMovie.releaseDate, equals(DateTime(2019, 11, 20)));
      expect(testMovie.imdbId, equals('tt4520988'));
    });
  });
}
