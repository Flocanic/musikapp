import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String title;
  final DateTime date;
  final String description;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
  });

  factory Event.fromMap(Map<String, dynamic> data, String documentId) {
    return Event(
      id: documentId,
      title: data['title'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'description': description,
    };
  }
}
