import 'dart:convert';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('Tests by using mock data', () {
    final List<Request> doneRequests = <Request>[];

    MockClient _getMockClient(String body, int statusCode) {
      return MockClient((Request request) {
        doneRequests.add(request);

        return Future<Response>(() {
          return Response(body, statusCode);
        });
      });
    }

    setUp(() {
      doneRequests.clear();
    });

    test('getDiscoverMoviesResults valid response test', () async {
      final Map<String, dynamic> bodyMap = <String, dynamic>{
        'page': 1,
        'total_results': 2,
        'total_pages': 1,
        'results': <Map<String, dynamic>>[
          <String, dynamic>{
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
          },
          <String, dynamic>{
            'popularity': 120.401,
            'vote_count': 8383,
            'video': false,
            'poster_path': '/jpfkzbIXgKZqCZAkEkFH2VYF63s.jpg',
            'id': 920,
            'adult': false,
            'backdrop_path': '/a1MlbLBk5Sy6YvMbSuKfwGlDVlb.jpg',
            'original_language': 'en',
            'original_title': 'Cars',
            'genre_ids': <int>[12, 16, 35, 10751],
            'title': 'Cars',
            'vote_average': 6.7,
            'overview':
                'Lightning McQueen, a hotshot rookie race car driven to succeed, discovers that life is about the journey, not the finish line, when he finds himself unexpectedly detoured in the sleepy Route 66 town of Radiator Springs. On route across the country to the big Piston Cup Championship in California to compete against two seasoned pros, McQueen gets to know the town\'s offbeat characters.',
            'release_date': '2006-06-08'
          }
        ]
      };

      // Get the response containing mock data
      final MockClient client = _getMockClient(json.encode(bodyMap), 200);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      final Map<String, dynamic> response = await apiProvider
          .getDiscoverMoviesResults(genres: <int>[movieIdAction]);

      // Verify the response
      expect(response['results'], isList);
      expect(response['results'].length, equals(2));

      // Verify the URL
      final String expectedUrl =
          'https://api.themoviedb.org/3/discover/movie?api_key=foo&with_genres=${movieIdAction.toString()}';
      expect(doneRequests.single.url.toString(), expectedUrl);
    });

    test('getDiscoverMoviesResults invalid JSON test', () async {
      // Verify the method throws an exception
      final MockClient client = _getMockClient('invalid response', 200);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      expect(
          () => apiProvider.getDiscoverMoviesResults(),
          throwsA(predicate<Exception>((Exception e) =>
              e is TMDBApiResponseException &&
              e.message == 'Response does not contain a valid JSON.')));
    });

    test('getDiscoverMoviesResults invalid status code test', () async {
      // Verify the method throws an exception
      final MockClient client = _getMockClient('{"foo": "bar"}', 500);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      expect(
          () => apiProvider.getDiscoverMoviesResults(),
          throwsA(predicate<Exception>((Exception e) =>
              e is TMDBApiResponseException &&
              e.message == 'Response status code does not equal 200.')));
    });

    test('getDiscoverMoviesResults valid response test', () async {
      final Map<String, dynamic> bodyMap = <String, dynamic>{
        'page': 1,
        'total_results': 2,
        'total_pages': 1,
        'results': 'invalid results'
      };

      // Get the response containing mock data
      final MockClient client = _getMockClient(json.encode(bodyMap), 200);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      expect(
          () => apiProvider.getDiscoverMoviesResults(),
          throwsA(predicate<Exception>((Exception e) =>
              e is TMDBApiResponseException &&
              e.message == 'Failed to create a list from value of results.')));
    });

    test('getDiscoverTVShowsResults valid response test', () async {
      final Map<String, dynamic> bodyMap = <String, dynamic>{
        'page': 1,
        'total_results': 7897,
        'total_pages': 395,
        'results': <Map<String, dynamic>>[
          <String, dynamic>{
            'original_name': 'Mayday',
            'id': 90,
            'name': 'Mayday',
            'popularity': 36.061,
            'vote_count': 94,
            'vote_average': 7.8,
            'first_air_date': '2003-09-03',
            'poster_path': '/cazh5xGS5I5KVVVRSd2xt3lZXVo.jpg',
            'genre_ids': <int>[99, 18],
            'original_language': 'en',
            'backdrop_path': '/nE4fKbVq1JY5dyauuAZSYcbh2hy.jpg',
            'overview':
                'Revealing the dark truth that aviation safety improves one crash at a time, Mayday  investigates legendary aviation disasters to find out what went wrong and why.\n\nBased on cockpit voice recorders, accident reports and eyewitness accounts, every episode also features interviews, state-of-the-art CGI and gripping reenactments.',
            'origin_country': <String>['CA']
          },
          <String, dynamic>{
            'original_name': 'Top Gear',
            'id': 45,
            'name': 'Top Gear',
            'popularity': 28.634,
            'vote_count': 351,
            'vote_average': 7.4,
            'first_air_date': '2002-10-20',
            'poster_path': '/sYx1OktL5q8kvRCuZ8Pccg8xLBy.jpg',
            'genre_ids': <int>[99],
            'original_language': 'en',
            'backdrop_path': '/ag2oZaayXrPL7XFEre5x4rBrxue.jpg',
            'overview':
                'The hosts talk about the latest cars and its specifications. They review the performance of the car and also find out if it is as good as the manufacturers claim. The current hosts are Chris Evans and Matt LeBlanc with The Stig.',
            'origin_country': <String>['GB']
          }
        ]
      };

      // Get the response containing mock data
      final MockClient client = _getMockClient(json.encode(bodyMap), 200);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      final Map<String, dynamic> response = await apiProvider
          .getDiscoverTVShowsResults(genres: <int>[tvShowIdDocumentary]);

      // Verify the response
      expect(response['results'], isList);
      expect(response['results'].length, equals(2));

      // Verify the URL
      final String expectedUrl =
          'https://api.themoviedb.org/3/discover/tv?api_key=foo&with_genres=${tvShowIdDocumentary.toString()}';
      expect(doneRequests.single.url.toString(), expectedUrl);
    });

    test('getMovieDetails valid response test', () async {
      final Map<String, dynamic> bodyMap = <String, dynamic>{
        'adult': false,
        'backdrop_path': '/mMZRKb3NVo5ZeSPEIaNW9buLWQ0.jpg',
        'belongs_to_collection': null,
        'budget': 63000000,
        'genres': <Map<String, dynamic>>[
          <String, dynamic>{'id': 18, 'name': 'Drama'}
        ],
        'homepage': 'http://www.foxmovies.com/movies/fight-club',
        'id': 550,
        'imdb_id': 'tt0137523',
        'original_language': 'en',
        'original_title': 'Fight Club',
        'overview':
            'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \'fight clubs\' forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
        'popularity': 35.429,
        'poster_path': '/adw6Lq9FiC9zjYEpOqfq03ituwp.jpg',
        'production_companies': <Map<String, dynamic>>[
          <String, dynamic>{
            'id': 508,
            'logo_path': '/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png',
            'name': 'Regency Enterprises',
            'origin_country': 'US'
          },
          <String, dynamic>{
            'id': 711,
            'logo_path': '/tEiIH5QesdheJmDAqQwvtN60727.png',
            'name': 'Fox 2000 Pictures',
            'origin_country': 'US'
          },
          <String, dynamic>{
            'id': 20555,
            'logo_path': '/hD8yEGUBlHOcfHYbujp71vD8gZp.png',
            'name': 'Taurus Film',
            'origin_country': 'DE'
          },
          <String, dynamic>{
            'id': 54051,
            'logo_path': null,
            'name': 'Atman Entertainment',
            'origin_country': ''
          },
          <String, dynamic>{
            'id': 54052,
            'logo_path': null,
            'name': 'Knickerbocker Films',
            'origin_country': 'US'
          },
          <String, dynamic>{
            'id': 25,
            'logo_path': '/qZCc1lty5FzX30aOCVRBLzaVmcp.png',
            'name': '20th Century Fox',
            'origin_country': 'US'
          },
          <String, dynamic>{
            'id': 4700,
            'logo_path': '/A32wmjrs9Psf4zw0uaixF0GXfxq.png',
            'name': 'The Linson Company',
            'origin_country': ''
          }
        ],
        'production_countries': <Map<String, dynamic>>[
          <String, dynamic>{'iso_3166_1': 'DE', 'name': 'Germany'},
          <String, dynamic>{
            'iso_3166_1': 'US',
            'name': 'United States of America'
          }
        ],
        'release_date': '1999-10-15',
        'revenue': 100853753,
        'runtime': 139,
        'spoken_languages': <Map<String, String>>[
          <String, String>{'iso_639_1': 'en', 'name': 'English'}
        ],
        'status': 'Released',
        'tagline': 'Mischief. Mayhem. Soap.',
        'title': 'Fight Club',
        'video': false,
        'vote_average': 8.4,
        'vote_count': 17725
      };

      // Get the response containing mock data
      final MockClient client = _getMockClient(json.encode(bodyMap), 200);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      final Map<String, dynamic> response =
          await apiProvider.getMovieDetails(550);

      // Verify the response
      expect(response['original_title'], equals('Fight Club'));
      expect(response['release_date'], equals('1999-10-15'));
      expect(response['id'], equals(550));

      // Verify the URL
      const String expectedUrl =
          'https://api.themoviedb.org/3/movie/550?api_key=foo';
      expect(doneRequests.single.url.toString(), expectedUrl);
    });

    test('getTVShowDetails valid response test', () async {
      final Map<String, dynamic> bodyMap = <String, dynamic>{
        'backdrop_path': null,
        'created_by': <String>[],
        'episode_run_time': <int>[30],
        'first_air_date': '1985-12-30',
        'genres': <Map<String, dynamic>>[
          <String, dynamic>{'id': 35, 'name': 'Comedy'}
        ],
        'homepage': '',
        'id': 10,
        'in_production': false,
        'languages': <String>['en'],
        'last_air_date': '1988-05-23',
        'last_episode_to_air': <String, dynamic>{
          'air_date': '1988-05-23',
          'episode_number': 6,
          'id': 1130596,
          'name': 'False Profits',
          'overview': '',
          'production_code': '',
          'season_number': 3,
          'show_id': 10,
          'still_path': null,
          'vote_average': 0.0,
          'vote_count': 0
        },
        'name': 'All in Good Faith',
        'next_episode_to_air': null,
        'networks': <Map<String, dynamic>>[
          <String, dynamic>{
            'name': 'ITV',
            'id': 9,
            'logo_path': '/5Rmw4ViYcjW14PCdOyjsue9eK99.png',
            'origin_country': 'GB'
          }
        ],
        'number_of_episodes': 18,
        'number_of_seasons': 3,
        'origin_country': <String>['GB'],
        'original_language': 'en',
        'original_name': 'All in Good Faith',
        'overview':
            'British sitcom in which Reverend Philip Lambe, after becoming bored in his wealthy Oxfordshire parish, asks for a transfer to a more difficult assignment. Sent to Edendale, a fictional urban town in the Midlands, he is accompanied by his wife Emma, sixteen-year-old daughter Miranda and twelve-year-old son Peter.',
        'popularity': 3.353,
        'poster_path': '/h9qveCyL3m6tNOrdhUabZk7khKt.jpg',
        'production_companies': <String>[],
        'seasons': <Map<String, dynamic>>[
          <String, dynamic>{
            'air_date': '1985-12-30',
            'episode_count': 6,
            'id': 2328143,
            'name': 'Season 1',
            'overview': '',
            'poster_path': '/bisvcIK9xIE0whLvPb2hQpfbfw9.jpg',
            'season_number': 1
          },
          <String, dynamic>{
            'air_date': '1987-02-26',
            'episode_count': 6,
            'id': 2328144,
            'name': 'Season 2',
            'overview': '',
            'poster_path': null,
            'season_number': 2
          },
          <String, dynamic>{
            'air_date': '1988-04-11',
            'episode_count': 6,
            'id': 2328142,
            'name': 'Season 3',
            'overview': '',
            'poster_path': null,
            'season_number': 3
          }
        ],
        'status': 'Ended',
        'type': 'Scripted',
        'vote_average': 1.5,
        'vote_count': 27
      };

      // Get the response containing mock data
      final MockClient client = _getMockClient(json.encode(bodyMap), 200);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      final Map<String, dynamic> response =
          await apiProvider.getTVShowDetails(10);

      // Verify the response
      expect(response['name'], equals('All in Good Faith'));
      expect(response['number_of_episodes'], equals(18));
      expect(response['id'], equals(10));

      // Verify the URL
      const String expectedUrl =
          'https://api.themoviedb.org/3/tv/10?api_key=foo';
      expect(doneRequests.single.url.toString(), expectedUrl);
    });

    test('getListMoviesGenreIDsResults valid response test', () async {
      final Map<String, dynamic> bodyMap = <String, dynamic>{
        'genres': <Map<String, dynamic>>[
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
        ]
      };

      // Get the response containing mock data
      final MockClient client = _getMockClient(json.encode(bodyMap), 200);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      final Map<String, dynamic> response =
          await apiProvider.getListMoviesGenreIDsResults();

      // Verify the response
      expect(response.containsKey('genres'), isTrue);

      // Verify the URL
      const String expectedUrl =
          'https://api.themoviedb.org/3/genre/movie/list?api_key=foo';
      expect(doneRequests.single.url.toString(), expectedUrl);
    });

    test('getListTVShowsGenreIDsResults valid response test', () async {
      final Map<String, dynamic> bodyMap = <String, dynamic>{
        'genres': <Map<String, dynamic>>[
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
          <String, dynamic>{
            'id': tvShowIdWarPolitics,
            'name': 'War & Politics'
          },
          <String, dynamic>{'id': tvShowIdWestern, 'name': 'Western'}
        ]
      };

      // Get the response containing mock data
      final MockClient client = _getMockClient(json.encode(bodyMap), 200);
      final TMDBApi apiProvider = TMDBApi(client, 'foo');
      final Map<String, dynamic> response =
          await apiProvider.getListTVShowsGenreIDsResults();

      // Verify the response
      expect(response.containsKey('genres'), isTrue);

      // Verify the URL
      const String expectedUrl =
          'https://api.themoviedb.org/3/genre/tv/list?api_key=foo';
      expect(doneRequests.single.url.toString(), expectedUrl);
    });
  });
}
