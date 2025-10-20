import 'package:flutter/material.dart';
import '../data/songs_data.dart';
import '../models/song.dart';
import 'playlist_screen.dart';
import 'song_detail_screen.dart';

class SongListScreen extends StatefulWidget {
  const SongListScreen({super.key});

  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  List<Song> songs = List.from(allSongs);

  void sortByTitle() => setState(() => songs.sort((a, b) => a.title.compareTo(b.title)));
  void sortByArtist() => setState(() => songs.sort((a, b) => a.artist.compareTo(b.artist)));
  void sortByDuration() => setState(() => songs.sort((a, b) => a.duration.compareTo(b.duration)));

  @override
  Widget build(BuildContext context) {
    final selectedSongs = songs.where((s) => s.isSelected).toList();
    final totalDuration = selectedSongs.fold<double>(0, (sum, s) => sum + s.duration);

    return Scaffold(
      appBar: AppBar(title: const Text("My Songs")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: sortByTitle, child: const Text("Sort by Title")),
              TextButton(onPressed: sortByArtist, child: const Text("Sort by Artist")),
              TextButton(onPressed: sortByDuration, child: const Text("Sort by Duration")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  title: Text("${song.title} - ${song.artist}"),
                  subtitle: Text("${song.duration} min"),
                  trailing: Checkbox(
                    value: song.isSelected,
                    onChanged: (v) => setState(() => song.isSelected = v!),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SongDetailScreen(song: song)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Total duration: ${totalDuration.toStringAsFixed(1)} min"),
          ),
          ElevatedButton(
            onPressed: selectedSongs.isEmpty
                ? null
                : () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PlaylistScreen(selectedSongs: selectedSongs),
              ),
            ),
            child: const Text("Let's Go"),
          ),
        ],
      ),
    );
  }
}
