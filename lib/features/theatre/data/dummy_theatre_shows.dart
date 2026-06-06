import '../domain/models/theatre_show.dart';
import '../domain/models/show_time.dart';

final List<TheatreShow> dummyTheatreShows = [
  TheatreShow(
    id: 'show_101',
    theatreId: '1',
    movieId: '1',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        showId: 'show_101',
        time: '10:20 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        showId: 'show_102',
        time: '01:25 PM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        showId: 'show_103',
        time: '04:30 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        showId: 'show_104',
        time: '07:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        showId: 'show_105',
        time: '10:30 PM',
        screenName: 'Audi 3',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),

  TheatreShow(
    id: 'show_102',
    theatreId: '1',
    movieId: '2',
    date: DateTime.now().add(const Duration(days: 1)),
    showTimes: [
      ShowTime(
        showId: 'show_106',
        time: '11:00 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        showId: 'show_107',
        time: '02:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        showId: 'show_108',
        time: '06:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),
];
