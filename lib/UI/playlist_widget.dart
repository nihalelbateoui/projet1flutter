import 'package:flutter/material.dart';
import '../data/song.dart';
import 'package:share_plus/share_plus.dart';

class PlaylistWidget extends StatelessWidget {
  final List<Song> songs;
  const PlaylistWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    final listText = songs.map((s) => "${s.title} - ${s.artist}").join('\n');

    return Scaffold(
      appBar: AppBar(title: const Text("Ma playlist")),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset('assets/photo2.png', height: 150, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: songs.map((s) => ListTile(title: Text("${s.title} – ${s.artist}"))).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () => Share.share(listText, subject: "Ma playlist 🎵"),
            child: const Text("Send to music app"),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
