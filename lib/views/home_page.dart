import 'package:flutter/material.dart';
import 'package:youlibv1/controllers/api_fetch.dart';
import 'package:youlibv1/models/book_model.dart';
import 'package:youlibv1/routes/routesnavbar.dart';
import 'package:youlibv1/widget/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  BNavigator ?myBnB;
  //Variable que contiene la lista de libros

  @override
  void initState() {
    myBnB = BNavigator(currentIndex: (i){
      setState(() {
        index =i;
      });

  });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBnB,
      //bottomNavigationBar: myBNB, //barra de navegación
      body: RoutesNavBar(index: index,),
      //una vez que llamamos la barra de navegacion mandamos a llamar a la primera pagina que es el catalogo
      /*floatingActionButton: FloatingActionButton(
        onPressed: ()=>{
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>ComentPage())//boton para que los usuarios dejen sus comentarios
          )
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.comment_sharp),
      ),*/

    );
  }
}

