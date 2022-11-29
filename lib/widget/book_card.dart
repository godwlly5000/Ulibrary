import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youlibv1/views/catalogo_page.dart';
import 'package:youlibv1/views/home_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const double kDefaultPadding = 20.0;

Widget Bookcard () => Card(//este es el widget que aparece al momento de dar clic en un libro del swiper

  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
  child: Column(
    children: [
      Stack(
        children: [
          Container(
            height: 50,
            width: 50,
            child: Scaffold(
              body: BackPageCard(),
                backgroundColor: Colors.white.withOpacity(0.0),
            ),
          ),
          Ink.image(//imagen de fondo para el card
            image: NetworkImage("https://m.media-amazon.com/images/I/81P0sAaVArL.jpg"),
            height: 250,
            fit: BoxFit.cover,
          ),
          Container(
           //aqui ira el bar
          ),
          Container(//imagen del libro completo
            child: Center(
              child: Image(
                image: NetworkImage('https://m.media-amazon.com/images/I/81P0sAaVArL.jpg'),
                height: 200,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Text(
              'MAZE RUNER',//titulo del libro
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Text(' Descripcion',
          style: GoogleFonts.anybody(fontSize: 20),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16).copyWith(bottom: 0),
        child: Text('The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
          style: TextStyle(fontSize: 16),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Text(' Autor',
          style: GoogleFonts.anybody(fontSize: 20),
        ),
      ),
    ],
  ),
);

//propiedades para el boton que sostiene  la imagen
class BooksCardBottom extends StatelessWidget {
  const BooksCardBottom({Key? key,
    this.press,
  }) : super(key: key);

  final press;

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.38,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child: Container(
              child: Image.network("https://m.media-amazon.com/images/I/81P0sAaVArL.jpg"),
              padding: EdgeInsets.all(kDefaultPadding / 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
        ),
    );
  }
}

class BackPageCard extends StatefulWidget {//aqui se encuentra el boton para regresar a la pantalla de inicio
  const BackPageCard({Key? key}) : super(key: key);

  @override
  State<BackPageCard> createState() => _BackPageCardState();
}

class _BackPageCardState extends State<BackPageCard> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
    icon: const Icon(Icons.keyboard_return),
    color: Colors.white,
      onPressed: ()=>{
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>CatalogoPage())//boton para que los usuarios dejen sus comentarios
        )
        // Add your onPressed code here!
      },
    );
  }
}
