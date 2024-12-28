import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, 'login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error logging out: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "HOME",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.amber),
                child: Column(children: [
                  const SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/avatar.jpg"),
                    ),
                  ),
                  Text(
                    user?.displayName ?? "User",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    user?.email ?? "Email",
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ]),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Covid Tracker'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.android),
                title: const Text('Emsi Chatbot'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                trailing: const Icon(Icons.arrow_forward),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () => _handleLogout(context),
              )
            ],
          ),
        ),
        body: const Center(
          child: Text(
            textAlign: TextAlign.center,
            "Welcome to the App",
            style: TextStyle(color: Colors.blueGrey, fontSize: 30),
          ),
        ));
  }
}
