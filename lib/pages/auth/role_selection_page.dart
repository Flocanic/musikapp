import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  Future<void> _selectRole(BuildContext context, String role) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'role': role,
      }, SetOptions(merge: true));
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final roles = ['Gitarrist', 'Sänger', 'Schlagzeuger', 'Bassist'];

    return Scaffold(
      appBar: AppBar(title: const Text("Rolle auswählen")),
      body: ListView.builder(
        itemCount: roles.length,
        itemBuilder: (context, index) {
          final role = roles[index];
          return ListTile(
            title: Text(role),
            onTap: () => _selectRole(context, role),
          );
        },
      ),
    );
  }
}
