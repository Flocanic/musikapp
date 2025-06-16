import 'package:flutter/material.dart';
import 'package:musikapp/models/event_model.dart';
import 'package:musikapp/models/event_model.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Datum: ${event.date.toLocal()}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(event.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
