import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../data/song_repository.dart';
import '../data/song.dart';
import 'song_widget.dart';
import 'playlist_widget.dart';
import 'song_detail_widget.dart';

class SongListWidget extends StatefulWidget {
  const SongListWidget({super.key});

  @override
  State<SongListWidget> createState() => _SongListWidgetState();
}

class _SongListWidgetState extends State<SongListWidget> {
  bool sortByTitle = false;
  bool sortByArtist = false;
  bool sortByDuration = false;

  @override
  Widget build(BuildContext context) {
    final repo = GetIt.instance<SongRepository>();
    final songs = repo.songs;

    if (sortByTitle) {
      songs.sort((a, b) => a.title.compareTo(b.title));
    } else if (sortByArtist) {
      songs.sort((a, b) => a.artist.compareTo(b.artist));
    } else if (sortByDuration) {
      songs.sort((a, b) => a.duration.compareTo(b.duration));
    }

    final selectedSongs = songs.where((s) => s.selected).toList();
    final total = selectedSongs.fold<double>(0, (sum, s) => sum + s.duration);

    return Scaffold(
      appBar: AppBar(title: const Text("Playlist : Sélection des morceaux")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    sortByTitle = true;
                    sortByArtist = false;
                    sortByDuration = false;
                  });
                },
                child: const Text("Trier par titre"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    sortByArtist = true;
                    sortByTitle = false;
                    sortByDuration = false;
                  });
                },
                child: const Text("Trier par artiste"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    sortByDuration = true;
                    sortByTitle = false;
                    sortByArtist = false;
                  });
                },
                child: const Text("Trier par durée"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SongDetailWidget(song: songs[index]),
                      ),
                    ).then((_) => setState(() {}));
                  },
                  child: SongWidget(
                    song: songs[index],
                    onSelect: (v) {
                      setState(() {
                        songs[index].selected = v!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Durée totale : ${total.toStringAsFixed(1)} min",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: selectedSongs.isEmpty
                ? null
                : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PlaylistWidget(songs: selectedSongs),
                ),
              );
            },
            child: const Text("Let's Go"),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
