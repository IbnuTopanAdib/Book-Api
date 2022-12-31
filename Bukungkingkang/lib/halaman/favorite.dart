import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../list_book.dart';
import '../main.dart';
import '../services/services.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late BooksHelper helper;
  List<dynamic> books = <dynamic>[];
  late int booksCount;

  @override
  void initState() {
    helper = BooksHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: HexColor('D9D9D9'),
        centerTitle: true,
        title: const Text(
          'Favorite Books',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.all(20), child: Text('My Favourite Books')),
          Padding(padding: EdgeInsets.all(20), child: BooksList(books, true)),
        ],
      ),
    );
  }

  Future initialize() async {
    books = await helper.getFavorites();
    setState(() {
      booksCount = books.length;
      books = books;
    });
  }
}
