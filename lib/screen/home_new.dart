import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:midterm_6400922/components/book_card.dart';
import 'package:midterm_6400922/model/book.dart';

class HomeNewScreen extends StatefulWidget {
  const HomeNewScreen({super.key});

  @override
  State<HomeNewScreen> createState() => _HomeNewScreenState();
}

class _HomeNewScreenState extends State<HomeNewScreen> {
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
      return Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          itemCount: _books.length,
          itemBuilder: (BuildContext context, int index) {
            return BookCard(book: _books[index]);
          },
        ),
      );
    }
  }
}
