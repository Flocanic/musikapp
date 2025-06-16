import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musikapp/models/song_model.dart';
import 'package:musikapp/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musikapp/pages/calendar/calendar_page.dart';
import 'package:musikapp/models/event_model.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Stream<List<Song>> getSongs() {
    return _db.collection('songs').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Song.fromMap(doc.data(), doc.id)).toList();
    });
  }

  Future<void> addSong(Song song) async {
    await _db.collection('songs').add(song.toMap());
  }

  Future<void> deleteSong(String id) async {
    await _db.collection('songs').doc(id).delete();
  }

  Stream<List<Event>> getEvents() {
    return _db.collection('events').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromMap(doc.data(), doc.id)).toList();
    });
  }

  Future<void> addEvent(Event event) async {
    await _db.collection('events').add(event.toMap());
  }

  Future<void> deleteEvent(String id) async {
    await _db.collection('events').doc(id).delete();
  }

  Future<List<Event>> getEventsForDay(DateTime day) async {
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));

    final querySnapshot = await _db
        .collection('events')
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .get();

    return querySnapshot.docs
        .map((doc) => Event.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
