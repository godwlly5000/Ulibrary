import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:youlibv1/remarks/listmessajes.dart';

class ComentPage extends StatelessWidget {
  ComentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListMessajes(),
    );
  }
  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title : const Text("Comentarios"),
    );
  }
}