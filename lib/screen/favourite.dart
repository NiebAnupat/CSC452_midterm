import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:midterm_6400922/components/book_card.dart';
import 'package:midterm_6400922/model/book.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late List<Book> _books = [];

  @override
  void initState() {
    Book.loadData().then((value) {
      setState(() {
        _books = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _books.isEmpty
          ? JumpingDots(
              color: Colors.red.shade900,
              radius: 10,
              numberOfDots: 3,
            )
          : Container(
              color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                itemCount: _books.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_books[index].isFavourite) {
                    return BookCard(book: _books[index]);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
    );
  }
}
