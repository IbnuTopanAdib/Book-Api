import 'package:flutter/foundation.dart';
import 'package:hexcolor/hexcolor.dart';

import '../list_book.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BooksHelper helper;
  // ignore: deprecated_member_use
  List<dynamic> books = <dynamic>[];
  late int booksCount;
  late TextEditingController txtSearchController;

  @override
  void initState() {
    helper = BooksHelper();
    txtSearchController = TextEditingController();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: HexColor('D9D9D9'),
          title: const Text(
            'My Books',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 231, 235),
                  borderRadius: BorderRadius.circular(8)),
              height: 40,
              width: double.infinity,
              child: TextField(
                  controller: txtSearchController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (text) {
                    helper.getBooks(text).then((value) {
                      books = value;
                      setState(() {
                        books = books;
                      });
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () =>
                            helper.getBooks(txtSearchController.text),
                      ),
                      hintText: 'Search',
                      border: InputBorder.none)),
            ),
          ),
          Padding(padding: EdgeInsets.all(20), child: BooksList(books, false)),
        ])));
  }

  Future initialize() async {
    books = (await helper.getBooks('Flutter'));
    setState(() {
      booksCount = books.length;
      books = books;
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BooksHelper>('helper', helper));
  }
}
