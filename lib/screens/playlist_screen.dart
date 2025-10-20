import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/song.dart';

class PlaylistScreen extends StatelessWidget {
  final List<Song> selectedSongs;
  const PlaylistScreen({super.key, required this.selectedSongs});

  @override
  Widget build(BuildContext context) {
    final textToShare =
    selectedSongs.map((s) => "${s.title} - ${s.artist}").join("\n");

    return Scaffold(
      appBar: AppBar(title: const Text("My Playlist")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: selectedSongs
                    .map((s) => ListTile(title: Text("${s.title} - ${s.artist}")))
                    .toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () => Share.share(textToShare, subject: "My Playlist 🎵"),
              child: const Text("Send to music app"),
            ),
          ],
        ),
      ),
    );
  }
}
