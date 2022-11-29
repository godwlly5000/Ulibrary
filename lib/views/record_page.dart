import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Record_Page extends StatefulWidget {
  const Record_Page({Key? key}) : super(key: key);

  @override
  State<Record_Page> createState() => _Record_PageState();
}

class _Record_PageState extends State<Record_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        centerTitle: true, title: Text("Registro",style: GoogleFonts.anybody(fontSize: 30)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(2000),bottomLeft: Radius.circular(2000))),
      ),
    );
  }
}