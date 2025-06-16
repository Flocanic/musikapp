class Song {
  final String id;
  final String title;
  final String artist;
  final String fileUrl;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.fileUrl,
  });

  factory Song.fromMap(Map<String, dynamic> data, String documentId) {
    return Song(
      id: documentId,
      title: data['title'] ?? '',
      artist: data['artist'] ?? '',
      fileUrl: data['fileUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'artist': artist,
      'fileUrl': fileUrl,
    };
  }
}