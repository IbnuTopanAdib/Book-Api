import 'package:buku/halaman/favorite.dart';
import 'package:buku/halaman/home.dart';
import 'package:buku/halaman/user.dart';

import 'package:buku/registerui.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final page = [MyHomePage(), FavoriteScreen(), const UserPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[index],
      bottomNavigationBar: MenuBawah(context),
    );
  }

  Container MenuBawah(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: HexColor('#D9D9D9'),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                index = 0;
              });
            },
            icon: index == 0
                ? Icon(
                    Icons.home_filled,
                    color: HexColor('EF2D2D'),
                    size: 35,
                  )
                : Icon(
                    Icons.home_outlined,
                    color: HexColor('C2B9B9'),
                    size: 35,
                  ),
          ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
              icon: index == 1
                  ? Icon(
                      Icons.favorite,
                      color: HexColor('EF2D2D'),
                      size: 35,
                    )
                  : Icon(Icons.favorite_border,
                      color: HexColor('C2B9B9'), size: 35)),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                index = 2;
              });
            },
            icon: index == 2
                ? Icon(
                    Icons.person,
                    color: HexColor('EF2D2D'),
                    size: 35,
                  )
                : Icon(
                    Icons.person_outline,
                    color: HexColor('C2B9B9'),
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
