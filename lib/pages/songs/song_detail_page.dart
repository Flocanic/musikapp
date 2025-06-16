import 'package:flutter/material.dart';
import 'package:musikapp/models/song_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SongDetailPage extends StatelessWidget {
  final Song song;

  const SongDetailPage({super.key, required this.song});

  Future<void> _openSongFile() async {
    final uri = Uri.parse(song.fileUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(song.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.artist, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _openSongFile,
              child: const Text("PDF öffnen"),
            ),
          ],
        ),
      ),
    );
  }
}
