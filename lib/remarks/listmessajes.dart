import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:youlibv1/remarks/messaje.dart';
import 'package:youlibv1/remarks/messaje_dao.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:youlibv1/widget/messagewidget.dart';
//import 'package:firebase_database/firebase_database.dart';

class ListMessajes extends StatefulWidget{
  ListMessajes({Key? key}) : super(key: key);

  final messajeDAO = MessajeDAO();

  @override
  ListMessajesState createState() => ListMessajesState();

}

class ListMessajesState extends State<ListMessajes>{
  ScrollController _scrollController = ScrollController();
  TextEditingController _messajeController = TextEditingController();

  @override
  Widget build(BuildContext context){
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollController);
    return Scaffold(
        appBar: AppBar (
          backgroundColor: Colors.grey[400],
          centerTitle: true, title: const Text("Comentarios"),
        ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            _getListMessajes(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: _messajeController,
                        onChanged: (text) =>setState(() {}),
                        onSubmitted: (input){
                          _sendMessaje();
                        },
                        decoration: const InputDecoration(
                          hintText: 'Escribe un comentario'
                        ),
                      ),
                    )
                ),
                IconButton(
                    icon: Icon(_cansendMessaje() ? CupertinoIcons.arrow_right_circle_fill :
                    CupertinoIcons.arrow_right_circle),
                    onPressed:(){
                      _sendMessaje();
                    }
                )
              ],
            )
          ],
        ),
        
      )
    );
  }

  void _sendMessaje(){
    if (_cansendMessaje()){
      final messaje = Messaje(_messajeController.text, DateTime.now());
      widget.messajeDAO.SaveMessaje(messaje);
      _messajeController.clear();
      setState((){});

    }
    }

    bool _cansendMessaje() => _messajeController.text.length > 0;

  Widget _getListMessajes() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.messajeDAO.getMessajes(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final messaje = Messaje.fromJson(json);
          return MessajeWidget(messaje.texto, messaje.fecha);
        }
      ),
    );
  }
  
  void _scrollHaciaAbajo() {
    if (_scrollController.hasClients){
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}