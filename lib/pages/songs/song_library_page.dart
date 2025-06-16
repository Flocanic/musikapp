import 'package:flutter/material.dart';
import 'package:musikapp/services/firestore_service.dart';
import 'package:musikapp/models/song_model.dart';
import 'package:go_router/go_router.dart';

class SongLibraryPage extends StatelessWidget {
  const SongLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Song-Bibliothek')),
      body: StreamBuilder<List<Song>>(
        stream: FirestoreService().getSongs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Center(child: Text("Fehler beim Laden"));
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final songs = snapshot.data!;
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return ListTile(
                title: Text(song.title),
                subtitle: Text(song.artist),
                onTap: () => context.push('/songs/${song.id}', extra: song),
              );
            },
          );
        },
      ),
    );
  }
}
