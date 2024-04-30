import 'package:flutter/material.dart';
import 'package:midterm_6400922/model/book.dart';

class BookDetail extends StatelessWidget {
  late Book book;

  BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SingleChildScrollView(
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
            const SizedBox(
              height: 20,
            ),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              book.author,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              book.description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
