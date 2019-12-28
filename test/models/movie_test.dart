import 'package:test/test.dart';

import 'package:binge_watch/models/movie.dart';

void main() {
  group('Model Movie tests', () {
    test('Movie.fromJson valid data test', () {
      final Map<String, dynamic> data = <String, dynamic>{
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

      final Movie testMovie = Movie.fromJson(data);
      expect(testMovie.releaseDate, equals(DateTime(2019, 11, 20)));
    });
  });
}
