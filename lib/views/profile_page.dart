import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.green[500],
          centerTitle: true, title: Text("Perfil",style: GoogleFonts.anybody(fontSize: 30)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(2000),bottomLeft: Radius.circular(2000))),
      ),
      body: EditProfile(),
    );
  }
}
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children:<Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black,
                      ),
                      Positioned(
                          bottom:3,
                          right: 2,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(Icons.edit),
                          )),

                  ]
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Text("Nombre", style: TextStyle(fontSize: 16, color: Colors.black)),

                  SizedBox(
                    height: 10,
                  ),

                  Text("Apellido", style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
          ),
          Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text("Informacion del usuario"),
                    Divider(),
                    ListTile(
                      title: Text("Uicacion"),
                      subtitle: Text("location"),
                      leading: Icon(Icons.location_on),
                    ),
                    ListTile(
                      title: Text("Email"),
                      subtitle: Text("location"),
                      leading: Icon(Icons.email),
                    ),
                    ListTile(
                      title: Text("Phone"),
                      subtitle: Text("location"),
                      leading: Icon(Icons.phone),
                    ),
                    ListTile(
                      title: Text("Sobre MI"),
                      subtitle: Text("location"),
                      leading: Icon(Icons.info),
                    ),
                  ],
                ),
              )
          ),
        ],

      ),
    );
  }
}
