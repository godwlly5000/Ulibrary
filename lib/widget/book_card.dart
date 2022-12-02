import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youlibv1/models/book_model.dart';
import 'package:youlibv1/views/catalogo_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const double kDefaultPadding = 20.0;

Widget Bookcard(Book book) =>  CardBook( book: book,);

class CardBook extends StatelessWidget {
  final Book book;
  const CardBook({
    Key? key, required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //este es el widget que aparece al momento de dar clic en un libro del swiper

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
              Ink.image(
                //imagen de fondo para el card

                image: NetworkImage(book.imageUrl),

                height: 250,

                fit: BoxFit.cover,
              ),
              Container(

                  //aqui ira el bar

                  ),
              Center(
                child: Image(
                  image: NetworkImage(book.imageUrl),
                  height: 200,
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  book.title, //titulo del libro

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              book.author,
              style: GoogleFonts.anybody(fontSize: 20),
            ),
          ),
          RatingBar.builder(
            initialRating: book.ratingPoints ?? 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: 10),
          Center(
            child:
                Text('Descripción', style: GoogleFonts.anybody(fontSize: 20)),
          ),
          Expanded(
              child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25)
                      .copyWith(bottom: 8),
                  child: Text(
                    book.synopsis,
                    style: const TextStyle(
                        fontSize: 16,
                        leadingDistribution:
                            TextLeadingDistribution.proportional),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          )),
          FloatingActionButton(
            backgroundColor: book.available ? Colors.green : Colors.grey,
            child:
                Icon(book.available ? Icons.archive_rounded : Icons.lock_clock),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Información'),
                content: Text( book.available ? 'Libro disponible para prestamo': 'El libro no está disponible para prestamo'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Ok'),
                    child: const Text('Cerrar'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//propiedades para el boton que sostiene  la imagen
class BooksCardBottom extends StatelessWidget {
  final String urlImage;
  final String title;
  const BooksCardBottom({
    Key? key,
    this.press,
    required this.urlImage,
    required this.title,
  }) : super(key: key);

  final press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.38,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: press,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding / 15),
                    height: 220.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FadeInImage(
                                  placeholder: const AssetImage(
                                      "images/placeholder.gif"),
                                  image: NetworkImage(urlImage))
                              .image),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    //child: Image.network(urlImage),
                  ),
                  Positioned(
                      bottom: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        width: size.width * 0.38,
                        height: 25,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(228, 0, 0, 0),
                            Color.fromARGB(127, 0, 0, 0),
                          ],
                          begin: FractionalOffset(0.0, 1),
                          end: FractionalOffset(0.0, 1),
                          stops: [0.0, 1.0],
                        )),
                        child: Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              overflow: TextOverflow.ellipsis),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackPageCard extends StatefulWidget {
  //aqui se encuentra el boton para regresar a la pantalla de inicio
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
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const CatalogoPage()) //boton para que los usuarios dejen sus comentarios
            )
        // Add your onPressed code here!
      },
    );
  }
}
