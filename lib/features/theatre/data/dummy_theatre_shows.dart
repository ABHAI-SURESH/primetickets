import '../domain/models/theatre_show.dart';
import '../domain/models/show_time.dart';

final List<TheatreShow> dummyTheatreShows = [
  TheatreShow(
    theatreId: '1',
    movieId: '1',
    date: DateTime.now(),

    showTimes: [
      ShowTime(
        time: '10:20 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        time: '01:25 PM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        time: '04:30 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        time: '07:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        time: '10:30 PM',
        screenName: 'Audi 3',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '1',
    movieId: '2',
    date: DateTime.now(),

    showTimes: [
      ShowTime(
        time: '11:00 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        time: '02:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),

      ShowTime(
        time: '06:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),
];
