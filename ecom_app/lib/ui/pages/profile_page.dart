import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.person)),
            const SizedBox(height: 12),
            Text(auth.isSignedIn ? 'Signed in (guest)' : 'Guest'),
            const SizedBox(height: 12),
            if (!auth.isSignedIn)
              ElevatedButton(
                onPressed: () => auth.signInGuest(),
                child: const Text('Continue as Guest'),
              )
            else
              ElevatedButton(
                onPressed: () => auth.signOut(),
                child: const Text('Sign out'),
              ),
          ],
        ),
      ),
    );
  }
}
