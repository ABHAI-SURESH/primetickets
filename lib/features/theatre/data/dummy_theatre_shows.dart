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
  TheatreShow(
    theatreId: '2',
    movieId: '1',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '09:30 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '12:45 PM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '04:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '07:15 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '2',
    movieId: '3',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '10:00 AM',
        screenName: 'Audi 3',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '01:15 PM',
        screenName: 'Audi 3',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '05:00 PM',
        screenName: 'Audi 3',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '09:00 PM',
        screenName: 'Audi 3',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '3',
    movieId: '2',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '11:15 AM',
        screenName: 'Screen 1',
        audioFormat: 'Dolby Digital',
      ),
      ShowTime(
        time: '02:30 PM',
        screenName: 'Screen 1',
        audioFormat: 'Dolby Digital',
      ),
      ShowTime(
        time: '06:15 PM',
        screenName: 'Screen 2',
        audioFormat: 'Dolby Digital',
      ),
      ShowTime(
        time: '09:45 PM',
        screenName: 'Screen 2',
        audioFormat: 'Dolby Digital',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '4',
    movieId: '1',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '10:30 AM',
        screenName: 'Screen 1',
        audioFormat: 'Dolby Digital',
      ),
      ShowTime(
        time: '01:45 PM',
        screenName: 'Screen 1',
        audioFormat: 'Dolby Digital',
      ),
      ShowTime(
        time: '05:00 PM',
        screenName: 'Screen 2',
        audioFormat: 'Dolby Digital',
      ),
      ShowTime(
        time: '08:15 PM',
        screenName: 'Screen 2',
        audioFormat: 'Dolby Digital',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '5',
    movieId: '4',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '09:45 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '01:00 PM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '04:15 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '07:30 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '19',
    movieId: '1',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '09:00 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '12:20 PM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '03:40 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '07:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '10:20 PM',
        screenName: 'Audi 3',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '20',
    movieId: '2',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '10:10 AM',
        screenName: 'Audi 4',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '01:30 PM',
        screenName: 'Audi 4',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '04:50 PM',
        screenName: 'Audi 5',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '08:10 PM',
        screenName: 'Audi 5',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '31',
    movieId: '3',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '10:00 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '01:15 PM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '04:30 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '07:45 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),

  TheatreShow(
    theatreId: '38',
    movieId: '5',
    date: DateTime.now(),
    showTimes: [
      ShowTime(
        time: '09:15 AM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '12:30 PM',
        screenName: 'Audi 1',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '03:45 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '07:00 PM',
        screenName: 'Audi 2',
        audioFormat: 'Dolby Atmos',
      ),
      ShowTime(
        time: '10:15 PM',
        screenName: 'Audi 3',
        audioFormat: 'Dolby Atmos',
      ),
    ],
  ),
];
