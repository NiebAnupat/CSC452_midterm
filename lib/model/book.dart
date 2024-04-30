import 'dart:convert';
import 'package:flutter/services.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavourite;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isFavourite,
  });

  static Future<List<Book>> loadData() async {
    final String jsonString = await rootBundle.loadString('assets/books.json');
    final jsonData = await _parseData(jsonString);
    return jsonData.map((item) => Book.fromJson(item)).toList();

    // fetch api to load data
    // final response = await http.get(
    //     Uri.parse("https://api.jsonbin.io/v3/qs/65f3d393dc74654018b32686"));
    // if (response.statusCode == 200) {
    //   return (json.decode(response.body)['record'] as List).map((data) {
    //     print(data);
    //     return Book.fromJson(data);
    //   }).toList();
    // return jsonData.map((item) => Book.fromJson(item)).toList();
    // } else {
    //   throw Exception('Failed to load data');
    // }
  }

  static Future<List<dynamic>> _parseData(String jsonString) async {
    final jsonData = await jsonDecode(jsonString);
    if (jsonData is List) {
      return jsonData;
    } else {
      throw const FormatException("Invalid JSON format. Expected a list.");
    }
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'],
      author: json['author'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
      imageUrl: json['imageUrl'] as String,
      isFavourite: json['isFavourite'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavourite': isFavourite,
    };
  }
}
