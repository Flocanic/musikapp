import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musikapp/pages/splash/splash_page.dart';
import 'package:musikapp/pages/auth/login_page.dart';
import 'package:musikapp/pages/home/home_page.dart';
import 'package:musikapp/pages/auth/register_page.dart';
import 'package:musikapp/pages/auth/role_selection_page.dart';
import 'package:musikapp/pages/songs/song_library_page.dart';
import 'package:musikapp/pages/songs/song_detail_page.dart';
import 'package:musikapp/pages/calendar/calendar_page.dart';
import 'package:musikapp/pages/calendar/event_detail_page.dart';
import 'package:musikapp/models/song_model.dart';
import 'package:musikapp/models/event_model.dart';
import 'package:musikapp/pages/profile/profile_page.dart';
import 'package:musikapp/pages/calendar/event_detail_page.dart';
import 'package:musikapp/pages/songs/file_viewer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(path: '/register', builder: (context, state) => const RegisterPage()),
    GoRoute(path: '/role-selection', builder: (context, state) => const RoleSelectionPage()),
    GoRoute(path: '/songs', builder: (context, state) => const SongLibraryPage()),
    GoRoute(path: '/songs/:id', builder: (context, state) {final song = state.extra as Song;return SongDetailPage(song: song);},),
    GoRoute(path: '/calendar', builder: (context, state) => const CalendarPage()),
    GoRoute(
      path: '/event/:id',
      builder: (context, state) {
        final event = state.extra as Event;
        return EventDetailPage(event: event);
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/event',
      builder: (context, state) {
        final event = state.extra as Event;
        return EventDetailPage(event: event);
      },
    ),
    GoRoute(
      path: '/pdf',
      builder: (context, state) {
        final fileUrl = state.extra as String;
        return FileViewerPage(fileUrl: fileUrl);
      },
    ),


  ],
);