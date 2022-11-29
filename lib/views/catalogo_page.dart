import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:youlibv1/widget/book_card.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyAppBarSliver(),
    );
  }
}

class MyAppBarSliver extends StatelessWidget {
  const MyAppBarSliver({super.key});

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
                  backgroundColor: Colors.green[500],
                  title: Text('Ulibrary',style: GoogleFonts.anybody(fontSize: 35),),
                  floating: true,
                  expandedHeight: 180.0,
                  forceElevated: innerBoxIsScrolled,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(300, 500))),
                  ),
              ];
            },
            body: ListView( //aqui acomodamos la vista
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  SizedBox(//separador de Swiper
                    height: 25,
                  ),
                  Container(
                    height: 40,
                    color: Colors.white.withOpacity(0.1),
                    child: Text('Recomendados',style: GoogleFonts.lalezar(fontSize: 25,color: Colors.grey[800]),),
                  ),
                  Container(//Mando a llamar al Swiper dentro del container
                    height: 250,
                    child: _swiper(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    color: Colors.white.withOpacity(0.1),
                    child: Text('Mas leidos',style: GoogleFonts.lalezar(fontSize: 25, color: Colors.grey[800]),),

                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 250,
                    child: _swiper(),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    height: 40,
                    color: Colors.white.withOpacity(0.1),
                    child: Text('Top 5',style: GoogleFonts.lalezar(fontSize: 25)),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 250,
                    child: _swiper(),
                  ),
                ]
            )
        )
    );
  }
}
Widget _swiper(){//Aqui es donde mandamos a llamar a los libros
  return Container(
      color: Colors.white.withOpacity(0.1),
      width: double.infinity,
      height: 210.0,
      child: Swiper(
        viewportFraction: 0.4,
        scale: 0.6,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Row(
              children: <Widget>[
            BooksCardBottom(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bookcard(),//mando a llamar el card del libro que se encunetra en los widgets book_card
                  ),
                );
              },
            ),
            ],//boton de tus libros favoritos
          )
            );
        },
        itemCount: 5,
        //pagination: new SwiperPagination(),
        //control: new SwiperPagination(),
        layout: SwiperLayout.DEFAULT,
      )
  );

}





