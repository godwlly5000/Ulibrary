import 'package:youlibv1/controllers/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youlibv1/views/record_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = "";
  final TextEditingController controllerUserName =  TextEditingController();
  final TextEditingController controllerUserPassword =  TextEditingController();

  Future<void> singnIn()async{
    try {
      await Auth().signIn(
        email: controllerUserName.text, 
        password: controllerUserPassword.text
      );
      
    } on FirebaseAuthException catch(e){
      setState((){
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 130),
        children:  [
          const Center( child: Text("Iniciar Sesión")),
          const SizedBox(height: 30,),
          TextFormField(
            controller: controllerUserName,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Usuario',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controllerUserPassword,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Contraseña',
            ),
          ),
          const SizedBox(height:12),
          Text(errorMessage!),
          const SizedBox(height: 30),
          TextButton(
            onPressed: singnIn,
            child: const Text("Iniciar sesión")), //iniciar sesion
          //Registrar
          TextButton(
              onPressed: ()=>{
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Record_Page())
                )
                // Add your onPressed code here!
              },
              child: const Text("Registro"))
        ],


      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Iniciar sesión"),
    );
  }
}
