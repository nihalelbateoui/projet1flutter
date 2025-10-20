import 'package:flutter/material.dart';
import '../models/song.dart';

class SongDetailScreen extends StatefulWidget {
  final Song song;
  const SongDetailScreen({super.key, required this.song});

  @override
  State<SongDetailScreen> createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  late TextEditingController titleCtrl;
  late TextEditingController artistCtrl;
  late TextEditingController albumCtrl;
  late TextEditingController durationCtrl;

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.song.title);
    artistCtrl = TextEditingController(text: widget.song.artist);
    albumCtrl = TextEditingController(text: widget.song.album);
    durationCtrl = TextEditingController(text: widget.song.duration.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Song Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: "Title")),
            TextField(controller: artistCtrl, decoration: const InputDecoration(labelText: "Artist")),
            TextField(controller: albumCtrl, decoration: const InputDecoration(labelText: "Album")),
            TextField(controller: durationCtrl, decoration: const InputDecoration(labelText: "Duration")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.song.title = titleCtrl.text;
                  widget.song.artist = artistCtrl.text;
                  widget.song.album = albumCtrl.text;
                  widget.song.duration = double.tryParse(durationCtrl.text) ?? widget.song.duration;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
