import 'package:flutter/material.dart';
import '../data/song.dart';

class SongWidget extends StatelessWidget {
  final Song song;
  final void Function(bool?) onSelect;

  const SongWidget({super.key, required this.song, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(song.artist),
                Text("${song.duration.toStringAsFixed(1)} min"),
              ],
            ),
          ),
          Checkbox(
            value: song.selected,
            onChanged: onSelect,
          ),
        ],
      ),
    );
  }
}
