import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ListView(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 120),
                    child: Container(
                        color: Colors.green[100],
                        child: Image.asset(
                          'img/book.jpg',
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        )),
                  ),
                  const Positioned(
                    top: 120,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 82,
                      child: CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('img/user.jpg')),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.userChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text('${snapshot.data?.email}');
                          } else {
                            return const Text("You haven't signed in yet");
                          }
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    const Card(
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    const Card(
                      child: ListTile(
                        leading: Icon(Icons.privacy_tip),
                        title: Text('About'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    const Card(
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
