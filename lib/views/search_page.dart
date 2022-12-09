import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youlibv1/controllers/api_fetch.dart';
import 'package:youlibv1/models/book_model.dart';
import 'package:youlibv1/widget/book_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late Future<List<Book>> listBooks;
  bool ok = false;
  bool fetch = false;
  final browserController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    browserController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        centerTitle: true,
        title: Text("Busca tu libro", style: GoogleFonts.anybody(fontSize: 30)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(2000),
                bottomLeft: Radius.circular(2000))),
      ),
      body: Column(
        children: [
          Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: browserController,
            style: const TextStyle(color: Colors.black87),
            onChanged: (v) => {
              if (v.length >= 2)
                {
                  setState(() {
                    ok = true;
                  })
                }
              else
                {
                  setState(() {
                    ok = false;
                  })
                }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              hintText: "Buscar",
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                backgroundColor: ok ? Colors.blue : Colors.grey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
                primary: Colors.white,
              ),
              onPressed: () {
                if (ok) {
                  setState(() {
                    fetch = true;
                    listBooks = browseBooks(browserController);
                  });
                }
              },
              child: Text("Buscar"))
        ],
      ),
    ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: fetch ? FutureBuilder<List<Book>>(
              future: listBooks,
              builder: ((context, snapshot){
                if(snapshot.data!.length != 0){
                  List<Book> list = snapshot.data!.map((e) => e).toList();
                  return ListView(
                    children: list.map((book) => ItemBook(book: book)).toList(),
                  );
                }else if(snapshot.hasError) {
                  log("message");
                    return Text('${snapshot.error}');
                }

                  // By default, show a loading spinner.
                  return const Center(child: Text("Sin resultados"));
              }),
            ): Center(child: Text("Busca algo", style:GoogleFonts.anybody(fontSize: 20),),),
          ))
        ],
      ),
    );
  }
}



class ItemBook extends StatelessWidget {
  final Book book;
  const ItemBook({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Bookcard(book),//mando a llamar el card del libro que se encunetra en los widgets book_card
              ),
            );
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(book.title, style: GoogleFonts.anybody(fontSize: 20)),
            Text(book.author, style: GoogleFonts.anybody(fontSize: 14))
          ],
        ),
      ),
    );
  }
}
