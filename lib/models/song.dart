class Song {
  String title;
  String artist;
  String album;
  double duration;
  bool isSelected;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    this.isSelected = false,
  });
}
