import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:musikapp/models/event_model.dart';
import 'package:musikapp/services/firestore_service.dart';
import 'package:musikapp/pages/calendar/event_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:musikapp/models/event_model.dart';


class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Event> _selectedEvents = [];

  final FirestoreService _firestoreService = FirestoreService();

  Future<void> _loadEvents(DateTime day) async {
    final events = await _firestoreService.getEventsForDay(day);
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadEvents(_focusedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalender')),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, focusedDay) {
              _focusedDay = focusedDay;
              _loadEvents(selectedDay);
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                final event = _selectedEvents[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(event.description),
                  onTap: () {
                    context.push('/event', extra: event);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
