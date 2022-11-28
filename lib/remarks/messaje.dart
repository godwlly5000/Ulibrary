
class Messaje {
  final String texto;
  final DateTime fecha;

  Messaje(this.texto,this.fecha);

  Messaje.fromJson(Map<dynamic, dynamic> json)
      : fecha = DateTime.parse(json['fecha'] as String),
        texto = json['texto'] as String;
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'fecha': fecha.toString(),
    'texto': texto,
  };

}