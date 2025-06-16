class AppFile {
  final String id;
  final String name;
  final String url;

  AppFile({
    required this.id,
    required this.name,
    required this.url,
  });

  factory AppFile.fromMap(Map<String, dynamic> data, String documentId) {
    return AppFile(
      id: documentId,
      name: data['name'] ?? '',
      url: data['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}
