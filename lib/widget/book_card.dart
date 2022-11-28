import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const double kDefaultPadding = 20.0;
var imagebooks = new Image.network(
    "https://m.media-amazon.com/images/I/81P0sAaVArL.jpg",
    fit: BoxFit.cover
);

Widget BookCard() => Card(
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
  ),
  child: Column(
    children: [
      Stack(
        children: [
          Ink.image(
            image: NetworkImage("https://m.media-amazon.com/images/I/81P0sAaVArL.jpg"),
            height: 300,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Text(
              'MAZE RUUNER',//titulo del libro
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.all(16).copyWith(bottom: 0),
        child: Text('The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ],
  ),
);

//propiedades
class BooksCardBottom extends StatelessWidget {
  const BooksCardBottom({Key? key,
    this.press,
  }) : super(key: key);

  final press;

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child: Container(
              child: Image.network("https://m.media-amazon.com/images/I/81P0sAaVArL.jpg"),
              padding: EdgeInsets.all(kDefaultPadding / 15),
              decoration: BoxDecoration(
                color: Colors.grey[400],
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
