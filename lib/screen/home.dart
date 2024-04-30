import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:midterm_6400922/components/book_card.dart';
import 'package:midterm_6400922/model/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    if (_books.isEmpty) {
      return Center(
          child: JumpingDots(
        color: Colors.red.shade900,
        radius: 10,
        numberOfDots: 3,
      ));
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 10,
        ),
        itemCount: _books.length,
        itemBuilder: (BuildContext context, int index) {
          return BookCard(book: _books[index]);
        },
      );
    }
  }
}
