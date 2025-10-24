import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'data/song_repository.dart';
import 'ui/song_list_widget.dart';

void main() {
  GetIt.instance.registerSingleton<SongRepository>(SongRepositoryDummyImpl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PROJETPLAYLISTFLUTTER',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
          bodyLarge: TextStyle(fontSize: 18),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      home: const SongListWidget(),
    );
  }
}
