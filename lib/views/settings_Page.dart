
import 'package:flutter/material.dart';
import 'package:youlibv1/widget/listSettings.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[500],
            centerTitle: true, title: Text("Ajustes",style: GoogleFonts.anybody(fontSize: 30)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(2000),bottomLeft: Radius.circular(2000))),
        ),

      body: ListSettings(),

    );
  }
}


