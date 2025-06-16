import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _instrument;
  String? _email;
  bool _loading = true;

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> _loadUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      final data = doc.data();
      setState(() {
        _email = user.email;
        _instrument = data?['instrument'] ?? 'Nicht gesetzt';
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _logout() async {
    await _auth.signOut();
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('E-Mail: $_email', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Instrument: $_instrument', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _logout,
              child: const Text('Abmelden'),
            ),
          ],
        ),
      ),
    );
  }
}
