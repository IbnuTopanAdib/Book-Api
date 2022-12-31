import 'package:buku/services/services.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksList extends StatelessWidget {
  final List<dynamic> books;
  final bool isFavorite;

  BooksList(this.books, this.isFavorite);

  final BooksHelper helper = BooksHelper();

  @override
  Widget build(BuildContext context) {
    final int booksCount = books.length;

    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        child: ListView.builder(
            itemCount: (booksCount == null) ? 0 : booksCount,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  selectedColor: HexColor('D9D9D9'),
                  title: Text(books[index].title),
                  subtitle: Text(books[index].authors),
                  onTap: () async {
                    Uri url = Uri.parse("${books[index].infoLink}");

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                  trailing: IconButton(
                      color: (isFavorite) ? Colors.red : Colors.yellow,
                      tooltip: (isFavorite)
                          ? 'Remove from favorites'
                          : 'Add to favorites',
                      icon: const Icon(Icons.favorite_outlined),
                      onPressed: () {
                        if (isFavorite) {
                          helper.removeFromFavorites(books[index], context);
                        } else {
                          helper.addToFavorites(books[index]);
                        }
                      }),
                ),
              );
            }));
  }
}
