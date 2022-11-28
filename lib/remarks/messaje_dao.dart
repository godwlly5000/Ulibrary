import 'package:firebase_database/firebase_database.dart';
import 'messaje.dart';

class MessajeDAO {

  final DatabaseReference _messajesRef = FirebaseDatabase.instance.reference()
      .child('Comentarios');

  void SaveMessaje(Messaje messaje){
    _messajesRef.push().set(messaje.toJson());
  }

  Query getMessajes() => _messajesRef;
}