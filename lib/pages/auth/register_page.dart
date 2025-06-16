import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedInstrument = 'Klavier';
  String _errorMessage = '';

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final List<String> _instruments = [
    'Klavier',
    'Gitarre',
    'Geige',
    'Schlagzeug',
    'Flöte',
    'Gesang'
  ];

  Future<void> _register() async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await _firestore.collection('users').doc(credential.user!.uid).set({
        'email': _emailController.text.trim(),
        'instrument': _selectedInstrument,
        'createdAt': FieldValue.serverTimestamp(),
      });

      context.go('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          _errorMessage = 'Diese E-Mail wird bereits verwendet. Du wirst zum Login weitergeleitet...';
        });

        await Future.delayed(const Duration(seconds: 2));
        context.go('/login'); // Leitet nach 2 Sekunden zum Login weiter
      } else {
        setState(() {
          _errorMessage = e.message ?? 'Fehler bei der Registrierung';
        });
      }
    }
  }

  void _continueAsGuest() {
    context.go('/home'); // Gastzugang
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrieren')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-Mail'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Passwort'),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedInstrument,
              items: _instruments
                  .map((inst) => DropdownMenuItem(
                value: inst,
                child: Text(inst),
              ))
                  .toList(),
              onChanged: (val) => setState(() => _selectedInstrument = val!),
              decoration: const InputDecoration(labelText: 'Instrument wählen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Registrieren'),
            ),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text('Schon registriert? Zum Login'),
            ),
            OutlinedButton(
              onPressed: _continueAsGuest,
              child: const Text('Ohne Login fortfahren'),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
