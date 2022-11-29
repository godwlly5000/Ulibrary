import 'package:flutter/material.dart';
import 'package:youlibv1/views/settings_Page.dart';
import 'package:youlibv1/views/search_Page.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;
  const BNavigator({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _BNavigatorState createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i){
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.green,
      //selectedLabelStyle: TextStyle(color: Colors.white),
      iconSize: 25.0,
      selectedFontSize: 14.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedFontSize: 12.0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white),
            label:"inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search,color: Colors.white),
          label:"inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp,color: Colors.white),
          label:"inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.white),
          label:"inicio",
        ),
      ],
    );
  }
}
