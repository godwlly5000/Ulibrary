import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class AppSliver extends StatelessWidget {
  const AppSliver({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
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
                  backgroundColor: Colors.grey[400],
                  title: const Text('Ulibrary'),
                  floating: true,
                  expandedHeight: 200.0,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[

              SizedBox(//separador de Swiper
              height: 50,
            ),
          Container(//Mando a llamar al Swiper dentro del container
            height: 250,
            child: _swiper(),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: Text('Recomendados'),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: _swiper(),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: Text('Mas leidos'),
          ),
          SizedBox(
            height: 10,
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

      width: double.infinity,
      height: 210.0,
      child: Swiper(
        viewportFraction: 0.5,
        scale: 0.7,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network("https://m.media-amazon.com/images/I/81P0sAaVArL.jpg", fit: BoxFit.fill,);
        },
        itemCount: 5,
        //pagination: new SwiperPagination(),
        //control: new SwiperPagination(),
        layout: SwiperLayout.DEFAULT,
      )
  );



}

