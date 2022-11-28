import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.black87,
          centerTitle: true, title: const Text("Favoritos")),
      
    );
  }
}

class Bok extends StatefulWidget {
  const Bok({Key? key}) : super(key: key);

  @override
  State<Bok> createState() => _BokState();
}

class _BokState extends State<Bok> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
            Container(
                /*width: double.infinity,
                height: 210.0,
                child: Swiper(
                  viewportFraction: 0.4,
                  scale: 0.7,
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network("https://m.media-amazon.com/images/I/81P0sAaVArL.jpg", fit: BoxFit.fill,);
                  },
                  itemCount: 5,
                  //pagination: new SwiperPagination(),
                  //control: new SwiperPagination(),
                  layout: SwiperLayout.DEFAULT,
                )*/
            ),

        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}

