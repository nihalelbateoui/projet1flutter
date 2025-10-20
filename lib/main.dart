import 'package:flutter/material.dart';
import 'screens/song_list_screen.dart';

void main() {
  runApp(const PlaylistApp());
}

class PlaylistApp extends StatelessWidget {
  const PlaylistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Playlist Creator',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const SongListScreen(),
    );
  }
}
