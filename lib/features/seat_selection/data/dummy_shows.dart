import '../domain/models/show.dart';

final dummyShows = [
  Show(
    id: 'show_101',
    movieId: '1',
    theatreId: '1',
    screenId: 'screen_1',
    date: DateTime.now(),
    time: '10:20 AM',
    audioFormat: 'Dolby Atmos',
  ),

  Show(
    id: 'show_102',
    movieId: '1',
    theatreId: '1',
    screenId: 'screen_1',
    date: DateTime.now(),
    time: '01:25 PM',
    audioFormat: 'Dolby Atmos',
  ),

  Show(
    id: 'show_103',
    movieId: '1',
    theatreId: '1',
    screenId: 'screen_2',
    date: DateTime.now(),
    time: '04:30 PM',
    audioFormat: 'Dolby Atmos',
  ),

  Show(
    id: 'show_104',
    movieId: '1',
    theatreId: '1',
    screenId: 'screen_2',
    date: DateTime.now(),
    time: '07:00 PM',
    audioFormat: 'Dolby Atmos',
  ),

  Show(
    id: 'show_105',
    movieId: '1',
    theatreId: '1',
    screenId: 'screen_3',
    date: DateTime.now(),
    time: '10:30 PM',
    audioFormat: 'Dolby Atmos',
  ),

  // Theatre 1 - Movie 2
  Show(
    id: 'show_106',
    movieId: '2',
    theatreId: '1',
    screenId: 'screen_1',
    date: DateTime.now().add(const Duration(days: 1)),
    time: '11:00 AM',
    audioFormat: 'Dolby Atmos',
  ),

  Show(
    id: 'show_107',
    movieId: '2',
    theatreId: '1',
    screenId: 'screen_2',
    date: DateTime.now().add(const Duration(days: 1)),
    time: '02:00 PM',
    audioFormat: 'Dolby Atmos',
  ),

  Show(
    id: 'show_108',
    movieId: '2',
    theatreId: '1',
    screenId: 'screen_2',
    date: DateTime.now().add(const Duration(days: 1)),
    time: '06:00 PM',
    audioFormat: 'Dolby Atmos',
  ),

  ///SRI MURUGAN
  Show(
    id: 'show_109',
    movieId: '1',
    theatreId: '53',
    screenId: 'srimurugan',
    date: DateTime.now(),
    time: '02:30 PM',
    audioFormat: 'Dolby Atmos',
  ),
  Show(
    id: 'show_110',
    movieId: '1',
    theatreId: '53',
    screenId: 'srimurugan',
    date: DateTime.now(),
    time: '06:30 PM',
    audioFormat: 'Dolby Atmos',
  ),
  Show(
    id: 'show_111',
    movieId: '1',
    theatreId: '53',
    screenId: 'srimurugan',
    date: DateTime.now(),
    time: '09:30 PM',
    audioFormat: 'Dolby Atmos',
  ),
];
