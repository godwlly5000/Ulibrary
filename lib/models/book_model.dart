// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
    Book({
        required this.id,
        required this.title,
        required this.lang,
        required this.format,
        required this.isbn,
        required this.authorId,
        required this.ratingPoints,
        required this.synopsis,
        required this.author,
        required this.imageUrl,
        required this.url,
        required this.available,
    });

    int id;
    String title;
    String lang;
    String format;
    String isbn;
    int authorId;
    dynamic ratingPoints;
    String synopsis;
    String author;
    String imageUrl;
    String url;
    bool available;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        lang: json["lang"],
        format: json["format"],
        isbn: json["isbn"],
        authorId: json["author_id"],
        ratingPoints: json["rating_points"],
        synopsis: json["synopsis"],
        author: json["author"],
        imageUrl: json["image_url"],
        url: json["url"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "lang": lang,
        "format": format,
        "isbn": isbn,
        "author_id": authorId,
        "rating_points": ratingPoints,
        "synopsis": synopsis,
        "author": author,
        "image_url": imageUrl,
        "url": url,
        "available": available,
    };
}
