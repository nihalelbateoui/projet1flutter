import 'song.dart';

abstract class SongRepository {
  abstract List<Song> songs;
}

class SongRepositoryDummyImpl implements SongRepository {
  @override
  List<Song> songs = [
    Song("Let It Bleed", "The Rolling Stones", 4.2),
    Song("Bohemian Rhapsody", "Queen", 5.9),
    Song("Imagine", "John Lennon", 3.2),
    Song("Come Together", "The Beatles", 4.1),
  ];
}
