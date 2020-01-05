import 'package:test/test.dart';

import 'package:binge_watch/models/tv_show.dart';

void main() {
  group('Model TVShow tests', () {
    final Map<String, dynamic> validDiscoverTVShowsData = <String, dynamic>{
      'original_name': 'Top Gear',
      'genre_ids': <int>[99],
      'name': 'Top Gear',
      'popularity': 51.248,
      'origin_country': <String>['GB'],
      'vote_count': 353,
      'first_air_date': '2002-10-20',
      'backdrop_path': '/ag2oZaayXrPL7XFEre5x4rBrxue.jpg',
      'original_language': 'en',
      'id': 45,
      'vote_average': 7.4,
      'overview':
          'The hosts talk about the latest cars and its specifications. They review the performance of the car and also find out if it is as good as the manufacturers claim. The current hosts are Chris Evans and Matt LeBlanc with The Stig.',
      'poster_path': '/sYx1OktL5q8kvRCuZ8Pccg8xLBy.jpg',
    };

    final Map<String, dynamic> validTVShowDetailsData = <String, dynamic>{
      'backdrop_path': '/ag2oZaayXrPL7XFEre5x4rBrxue.jpg',
      'created_by': <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 1316479,
          'credit_id': '5681665fc3a36828f50068ac',
          'name': 'Derek Smith',
          'gender': 2,
          'profile_path': '/kclAcT37hTJUta0SGIL6lLRaD5h.jpg'
        }
      ],
      'episode_run_time': <int>[60],
      'first_air_date': '2002-10-20',
      'genres': <Map<String, dynamic>>[
        <String, dynamic>{'id': 99, 'name': 'Documentary'}
      ],
      'homepage': 'http://www.bbc.co.uk/programmes/b006mj59',
      'id': 45,
      'in_production': true,
      'languages': <String>['en'],
      'last_air_date': '2019-07-14',
      'last_episode_to_air': <String, dynamic>{
        'air_date': '2019-07-14',
        'episode_number': 5,
        'id': 1851662,
        'name': 'Episode 5',
        'overview':
            'Freddie Flintoff heads to Iceland to compete in the world\'s maddest motorsport, while Paddy McGuinness gets to grips with the new Toyota Supra. Chris Harris investigates the story of the Lotus 79, the most beautiful F1 car of all time',
        'production_code': '',
        'season_number': 27,
        'show_id': 45,
        'still_path': '/bove5Y1FbqZ3vrPXPNqQGZtSoKF.jpg',
        'vote_average': 0.0,
        'vote_count': 0
      },
      'name': 'Top Gear',
      'next_episode_to_air': null,
      'networks': <Map<String, dynamic>>[
        <String, dynamic>{
          'name': 'BBC Two',
          'id': 332,
          'logo_path': '/bfAVKGrJGcKTAndYktB7cf8UlBO.png',
          'origin_country': 'GB'
        }
      ],
      'number_of_episodes': 192,
      'number_of_seasons': 27,
      'origin_country': <String>['GB'],
      'original_language': 'en',
      'original_name': 'Top Gear',
      'overview':
          'The hosts talk about the latest cars and its specifications. They review the performance of the car and also find out if it is as good as the manufacturers claim. The current hosts are Chris Evans and Matt LeBlanc with The Stig.',
      'popularity': 51.248,
      'poster_path': '/sYx1OktL5q8kvRCuZ8Pccg8xLBy.jpg',
      'production_companies': <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 3324,
          'logo_path': '/16fY7pucCzn7WSOYxOGRHlAayL3.png',
          'name': 'BBC',
          'origin_country': 'GB'
        }
      ],
      'seasons': <Map<String, dynamic>>[
        <String, dynamic>{
          'air_date': '2003-07-27',
          'episode_count': 77,
          'id': 69,
          'name': 'Specials',
          'overview': '',
          'poster_path': '/jWUgsAi9a0NN8BzkgnIsTNVwpqJ.jpg',
          'season_number': 0
        },
        <String, dynamic>{
          'air_date': '2002-10-20',
          'episode_count': 11,
          'id': 53,
          'name': 'Series 1',
          'overview':
              'The first series of the relaunched television series Top Gear was broadcast in the United Kingdom on BBC Two starting on 20 October 2002, and concluding on 29 December 2002, and contained 10 episodes. The series included presenters Jeremy Clarkson, Richard Hammond and Jason Dawe. This was Dawe\'s only series as a presenter on Top Gear.',
          'poster_path': '/zRVrg9wT9DVqPvKJdlyrN1gONg3.jpg',
          'season_number': 1
        },
      ],
      'status': 'Returning Series',
      'type': 'Documentary',
      'vote_average': 7.4,
      'vote_count': 353
    };

    test('TVShow.fromJson valid TV shows discover data test', () {
      final TVShow testTVShow = TVShow.fromJson(validDiscoverTVShowsData);
      expect(testTVShow.firstAirDate, equals(DateTime(2002, 10, 20)));
      expect(testTVShow.genreIds, equals(<int>[99]));
    });

    test('TVShow.fromJson no name TV shows discover data test', () {
      final Map<String, dynamic> data =
      Map<String, dynamic>.from(validDiscoverTVShowsData);
      data.remove('name');

      final TVShow testTVShow = TVShow.fromJson(data);
      expect(testTVShow.name, isNull);
    });

    test('TVShow.fromJson valid TV show details data test', () {
      final TVShow testTVShow = TVShow.fromJson(validTVShowDetailsData);
      expect(testTVShow.genreIds, equals(<int>[99]));
      expect(testTVShow.firstAirDate, equals(DateTime(2002, 10, 20)));
      expect(testTVShow.lastAirDate, equals(DateTime(2019, 7, 14)));
    });
  });
}
