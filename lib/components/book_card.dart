import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_6400922/model/book.dart';
import 'package:midterm_6400922/screen/book_detail.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => BookDetail(book: book)),
          );
        },
        child: Card(
          // color: Colors.red,
          // shadowColor: Colors.black54,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(10)),
                  child: Image.network(
                    book.imageUrl,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: GoogleFonts.chakraPetch(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      book.author,
                      style: GoogleFonts.chakraPetch(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${book.price} บาท',
                          style: GoogleFonts.chakraPetch(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.red.shade900,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            book.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: book.isFavourite
                                ? Colors.red.shade900
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
