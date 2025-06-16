import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final bool isGuest = user == null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MusikApp'),
        actions: [
          if (!isGuest)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                context.go('/login');
              },
              tooltip: 'Logout',
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isGuest
                  ? 'Willkommen, Gast!'
                  : 'Willkommen, ${user!.email ?? "Benutzer"}!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            const Text(
              'Dies ist deine Startseite. Hier kannst du später deine Lieblingssongs, Playlists oder empfohlene Musik sehen.',
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Beispielnavigation – hier kannst du z. B. zu einer Musikliste gehen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Feature kommt bald!')),
                );
              },
              icon: const Icon(Icons.library_music),
              label: const Text('Meine Musik'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // Beispielnavigation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Suche kommt bald!')),
                );
              },
              icon: const Icon(Icons.search),
              label: const Text('Musik entdecken'),
            ),
            const SizedBox(height: 30),
            if (isGuest)
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Jetzt einloggen, um mehr zu erleben'),
              ),
          ],
        ),
      ),
    );
  }
}
