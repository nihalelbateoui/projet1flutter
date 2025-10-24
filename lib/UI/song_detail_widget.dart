import 'package:flutter/material.dart';
import '../data/song.dart';

class SongDetailWidget extends StatefulWidget {
  final Song song;
  const SongDetailWidget({super.key, required this.song});

  @override
  State<SongDetailWidget> createState() => _SongDetailWidgetState();
}

class _SongDetailWidgetState extends State<SongDetailWidget> {
  late TextEditingController titleCtrl;
  late TextEditingController artistCtrl;
  late TextEditingController albumCtrl;
  late TextEditingController durationCtrl;

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.song.title);
    artistCtrl = TextEditingController(text: widget.song.artist);
    albumCtrl = TextEditingController(text: "Let It Bleed");
    durationCtrl = TextEditingController(text: widget.song.duration.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.song.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title", style: Theme.of(context).textTheme.labelLarge),
            TextField(controller: titleCtrl),
            const SizedBox(height: 8),
            Text("Artist", style: Theme.of(context).textTheme.labelLarge),
            TextField(controller: artistCtrl),
            const SizedBox(height: 8),
            Text("Album", style: Theme.of(context).textTheme.labelLarge),
            TextField(controller: albumCtrl),
            const SizedBox(height: 8),
            Text("Duration", style: Theme.of(context).textTheme.labelLarge),
            TextField(controller: durationCtrl),
            const SizedBox(height: 20),
            Image.asset('assets/photo1.png', height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.song.title = titleCtrl.text;
                  widget.song.artist = artistCtrl.text;
                  widget.song.duration =
                      double.tryParse(durationCtrl.text) ?? widget.song.duration;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
