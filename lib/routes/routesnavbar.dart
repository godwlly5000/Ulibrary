import 'package:youlibv1/views/catalogo_page.dart';
import 'package:youlibv1/views/profile_page.dart';
import 'package:youlibv1/views/search_page.dart';
import 'package:youlibv1/views/settings_Page.dart';
import 'package:flutter/material.dart';

class RoutesNavBar extends StatelessWidget {
  final int index;
  const RoutesNavBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {//En esta parte mandaos a llamar las paginas de nuestra aplicacion que queremos que se vea en nuestro NabBAR
    List<Widget> myList = [
      CatalogoPage(),
      SearchPage(),
      ProfilePage(),
      SettingsPage()

    ];
    return myList[index];
  }
}


