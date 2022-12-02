import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:youlibv1/models/book_model.dart';

const String apibase = "http://192.168.43.55:3050";

Future<List<Book>> fecthBooks() async {
  final response = await http
      .get(Uri.parse('$apibase/books.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return (jsonDecode(response.body) as List).map((bookJson) => Book.fromJson(bookJson)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


Future<List<Book>> browseBooks(TextEditingController controller) async{
  final response = await http
      .get(Uri.parse('$apibase/books.json?title=${controller.text}'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return (jsonDecode(response.body) as List).map((bookJson) => Book.fromJson(bookJson)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  
}