import 'package:prime_tickets/features/movies/domain/models/movie.dart';
import 'package:prime_tickets/features/movies/domain/models/person.dart';

final List<Movie> dummyMovies = [
  Movie(
    id: '1',
    title: 'Doomsday',
    imagePath: 'assets/images/movies/doomsday.jpg',
    genre: 'Action • Thriller',
    duration: '2h 10m',
    certificate: 'UA16+',
    languages: ['English'],
    rating: 8.5,
    description:
        'A catastrophic viral outbreak spreads rapidly across continents, collapsing governments and pushing humanity to the brink of extinction. As cities fall into chaos, a small group of scientists and survivors race against time to find a cure while battling both the infected and the breakdown of society itself. Trust becomes fragile, survival instincts take over, and every decision could mean life or death in a world spiraling toward doomsday.',
    bookedCount: 1800,
    cast: [
      Person(
        name: 'Robert D Jr',
        imagePath: 'assets/images/cast/robert_d_jr.jpg',
      ),
      Person(
        name: 'Chris Evans',
        imagePath: 'assets/images/cast/chris_evans.jpg',
      ),
    ],
    crew: [
      Person(
        name: 'Anthony Russo',
        imagePath: 'assets/images/crew/antony_russo.jpg',
      ),
    ],
  ),

  Movie(
    id: '2',
    title: 'Dune',
    imagePath: 'assets/images/movies/dune.jpg',
    genre: 'Sci-Fi • Adventure',
    duration: '2h 35m',
    certificate: 'U',
    languages: ['English', 'Hindi'],
    rating: 7.9,
    description:
        'Set in the distant future, the story follows Paul Atreides, a gifted young man born into a great destiny beyond his understanding. His family takes control of Arrakis, the most dangerous planet in the universe and the only source of the valuable spice that powers space travel. As betrayal unfolds and war erupts, Paul must rise to lead, navigating political intrigue, prophecy, and survival in a harsh desert world filled with giant sandworms and ancient secrets.',
    bookedCount: 2500,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '3',
    title: 'Infinity War',
    imagePath: 'assets/images/movies/infinity_war.jpg',
    genre: 'Action • Sci-Fi',
    duration: '2h 30m',
    certificate: 'UA13+',
    languages: ['English', 'Hindi'],
    rating: 9.0,
    description:
        'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.',
    bookedCount: 5000,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '4',
    title: 'Spiderman Far From Home',
    imagePath: 'assets/images/movies/spiderman.jpg',
    genre: 'Superhero • Action',
    duration: '2h 10m',
    certificate: 'UA13+',
    languages: ['English', 'Malayalam'],
    rating: 8.2,
    description:
        'Following the events that changed the world forever, Peter Parker embarks on a school trip across Europe, hoping to leave behind his responsibilities as Spider-Man and live a normal teenage life. However, new threats emerge in the form of mysterious elemental creatures, forcing Peter to step up once again. Torn between duty and desire, he must decide what kind of hero he truly wants to become.',
    bookedCount: 2100,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '6',
    title: 'Project Hail Mary',
    imagePath: 'assets/images/movies/projecthailmary.jpeg',
    genre: 'Sci-Fi',
    duration: '2h 20m',
    certificate: 'UA13+',
    languages: ['English'],
    rating: 10,
    description:
        'A lone astronaut awakens aboard a spacecraft with no memory of who he is or how he got there. As fragments of his past slowly return, he realizes he is humanity’s last hope in a desperate mission to save Earth from an extinction-level threat. With limited resources, unexpected allies, and overwhelming odds, he must rely on science, courage, and determination to complete a mission that could determine the fate of all life.',
    bookedCount: 3200,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '7',
    title: 'Deadpool and Wolverine',
    imagePath: 'assets/images/movies/deadpool_wolverine.jpeg',
    genre: 'Action • Comedy',
    duration: '2h 05m',
    certificate: 'UA18+',
    languages: ['English'],
    rating: 9.0,
    description:
        'When a chaotic mercenary with a twisted sense of humor crosses paths with a gruff, battle-hardened mutant, the result is an explosive and unpredictable partnership. Forced to work together against a powerful new enemy, Deadpool and Wolverine clash in personality but complement each other in combat. Packed with brutal action, sharp wit, and unexpected emotional moments, their journey pushes both heroes to their limits.',
    bookedCount: 4000,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '8',
    title: 'The Dark Knight',
    imagePath: 'assets/images/movies/the_dark_knight.jpeg',
    genre: 'Crime • Action',
    duration: '2h 32m',
    certificate: 'UA13+',
    languages: ['English'],
    rating: 10.0,
    description:
        'As Gotham faces a new wave of organized crime, Batman steps up to protect the city alongside allies like Commissioner Gordon and Harvey Dent. However, the emergence of the Joker — a criminal mastermind driven by chaos — pushes Gotham into anarchy. As moral lines blur and sacrifices become inevitable, Batman must confront what it truly means to be a hero in a world where order and justice are constantly under threat.',
    bookedCount: 8000,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '9',
    title: 'Zootopia 2',
    imagePath: 'assets/images/movies/zootopia_2.jpeg',
    genre: 'Animation • Family',
    duration: '1h 50m',
    certificate: 'UA13+',
    languages: ['English'],
    rating: 8.0,
    description:
        'In the ever-evolving city of Zootopia, where animals of all kinds coexist, new challenges arise that threaten the harmony of the metropolis. Judy Hopps and Nick Wilde reunite to investigate a mysterious case that leads them deep into uncharted parts of the city. As secrets unfold and tensions rise, they must rely on trust, teamwork, and courage to protect the fragile unity of their world.',
    bookedCount: 1200,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '10',
    title: 'F1 The Movie',
    imagePath: 'assets/images/movies/f1_themovie.jpeg',
    genre: 'Sports • Drama',
    duration: '2h 15m',
    certificate: 'UA13+',
    languages: ['English'],
    rating: 7.0,
    description:
        'Set in the high-stakes world of Formula 1 racing, the story follows a talented but troubled driver fighting to prove himself on the global stage. With intense rivalries, team politics, and the constant danger of the sport, every race becomes a battle not just for victory, but for redemption. As the season unfolds, he must confront his past, push beyond his limits, and chase glory at unimaginable speeds.',
    bookedCount: 900,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '11',
    title: 'Inception',
    imagePath: 'assets/images/movies/inception.jpeg',
    genre: 'Sci-Fi • Thriller',
    duration: '2h 28m',
    certificate: 'UA13+',
    languages: ['English'],
    rating: 6.0,
    description:
        'A skilled thief who specializes in extracting secrets from within the subconscious is given a seemingly impossible task: to plant an idea into someone’s mind. As he assembles a team to dive deep into layered dream worlds, the mission becomes increasingly dangerous. Haunted by his past and unable to distinguish reality from illusion, he must complete the job before time runs out — or risk losing everything.',
    bookedCount: 3000,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '12',
    title: 'Top Gun Maverick',
    imagePath: 'assets/images/movies/topgun_maverik.jpeg',
    genre: 'Action • Drama',
    duration: '2h 10m',
    certificate: 'UA13+',
    languages: ['English'],
    rating: 10.0,
    description:
        'After decades of service, Pete “Maverick” Mitchell remains one of the Navy’s top aviators, refusing to be grounded despite the changing world around him. Tasked with training a new generation of elite pilots for a dangerous mission, Maverick must confront his past, his fears, and the legacy he leaves behind. As the stakes rise, the mission demands not just skill, but sacrifice.',
    bookedCount: 6000,
    cast: [],
    crew: [],
  ),

  Movie(
    id: '13',
    title: 'Avatar: Fire and Ash',
    imagePath: 'assets/images/movies/avatar_fire_and_ash.jpeg',
    genre: 'Fantasy • Sci-Fi',
    duration: '2h 40m',
    certificate: 'UA13+',
    languages: ['English'],
    rating: 10.0,
    description:
        'On the vibrant world of Pandora, new conflicts emerge as different clans face threats that could change their way of life forever. As tensions rise between nature and expanding forces, alliances are tested and new leaders emerge. With breathtaking landscapes and powerful emotions, the story explores survival, unity, and the fight to protect a world worth saving.',
    bookedCount: 7000,
    cast: [],
    crew: [],
  ),
];
