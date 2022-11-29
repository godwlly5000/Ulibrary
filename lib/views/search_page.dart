import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[500],
        centerTitle: true, title: Text("Busca tu libro",style: GoogleFonts.anybody(fontSize: 30)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(2000),bottomLeft: Radius.circular(2000))),
      ),
      body: Searchs(),

    );
  }
}

class Searchs extends StatefulWidget {
  const Searchs({Key? key}) : super(key: key);

  @override
  State<Searchs> createState() => _SearchsState();
}

class _SearchsState extends State<Searchs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}


