import 'package:flutter/material.dart';
import 'package:youlibv1/controllers/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youlibv1/widget/appbar_sliver.dart';

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

        TextButton(
              style: flatButtonStyle,
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>AppSliver())//te manda a la pagina de tu perfil
            )
          },
              child: Text('Herramientas'),
        ),
        TextButton(
          style: flatButtonStyle,
          onPressed: signOut,
          child: Text('Salir'),
        ),
      ],
    );
  }
}
