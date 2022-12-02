
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:youlibv1/controllers/api_fetch.dart';
import 'package:youlibv1/models/book_model.dart';
import 'package:youlibv1/widget/book_card.dart';
import 'package:google_fonts/google_fonts.dart';




class CatalogoPage extends StatefulWidget {
  const CatalogoPage({super.key});

  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  //Variable que contiene la lista de libros
  late Future<List<Book>> listBooks;

  @override
  void initState() {
    super.initState();
    listBooks = fecthBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          // Setting floatHeaderSlivers to true is required in order to float
          // the outer slivers over the inner scrollable.
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.green[500],
                  title: Text('Ulibrary',style: GoogleFonts.anybody(fontSize: 35),),
                  floating: true,
                  expandedHeight: 180.0,
                  forceElevated: innerBoxIsScrolled,
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(300, 500))),
                  ),
              ];
            },
            body: Center(
              child: FutureBuilder<List<Book>>(
                future: listBooks,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Book> listBook = snapshot.data!.map((e) => e).toList();
                    return Catalog(listBooks: listBook);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator(
                    value: 30,
                  );
                },
              ),
            ),
        )
    );
  }
}

class Catalog extends StatelessWidget {
  final List<Book> listBooks;
  const Catalog({
    Key? key, required this.listBooks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView( //aqui acomodamos la vista
        padding: const EdgeInsets.all(8),
        children: <Widget> [
          CarouselBooks(books: listBooks, tag: "Más leídos",),
          CarouselBooks(books: listBooks, tag: "Favoritos"),
          CarouselBooks(books: listBooks, tag: "Recomemndados"),
        ]
    );
  }
}

Widget _swiper(List<Book> books){//Aqui es donde mandamos a llamar a los libros
  return Container(
    color: Colors.white.withOpacity(0.1),
    width: double.infinity,
    height: 210.0,
    child: Swiper(
      viewportFraction: 0.4,
      scale: 0.6,
      itemBuilder: (BuildContext context, int index){
        return BooksCardBottom(
          urlImage: books[index].imageUrl,
          title: books[index].title,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Bookcard(books[index]),//mando a llamar el card del libro que se encunetra en los widgets book_card
              ),
            );
          },
        );
      },
      itemCount: books.length,
      //pagination: new SwiperPagination(),
      //control: new SwiperPagination(),
      layout: SwiperLayout.DEFAULT,
    )
  );

}

class CarouselBooks extends StatelessWidget {
  final List<Book> books;
  final String tag;
  const CarouselBooks({super.key, required this.books, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [
      SizedBox(
        height: 40,
        width: double.maxFinite,
        child: Text(
          tag,
          style: GoogleFonts.lalezar(fontSize: 22, color: Colors.black),
          textAlign: TextAlign.start,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 250,
        child: _swiper(books),
      ),
    ],);
  }
}