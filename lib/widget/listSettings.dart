import 'package:flutter/material.dart';
import 'package:youlibv1/controllers/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
class ListSettings extends StatelessWidget {
  ListSettings({super.key});
  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await Auth().signOut();
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black,
    backgroundColor: Colors.white,
    minimumSize: Size(100, 40),
    padding: EdgeInsets.symmetric(horizontal: 110),
    textStyle: const TextStyle(fontSize: 18),
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        //Mando a llamar al Swiper dentro del container

        OutlinedButton.icon(
          label: Text('Salir',style: GoogleFonts.anybody(fontSize: 15, color: Colors.black87)),
          icon: Icon(Icons.output_sharp,color: Colors.black87),
          onPressed: signOut,
        ),
      ],
    );
  }
}
