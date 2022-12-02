import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.green,
      //selectedLabelStyle: TextStyle(color: Colors.white),
      iconSize: 25.0,
      selectedFontSize: 14.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedFontSize: 12.0,
      items: const [
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,color: Colors.white, size: 30),
            icon: Icon(Icons.home,color: Colors.white60),
            label:"inicio",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.search,color: Colors.white, size: 30),
          icon: Icon(Icons.search,color: Colors.white60),
          label:"inicio",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.account_circle_sharp,color: Colors.white, size: 30),
          icon: Icon(Icons.account_circle_sharp,color: Colors.white60),
          label:"inicio",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings,color: Colors.white, size: 30),
          icon: Icon(Icons.settings,color: Colors.white60),
          label:"inicio",
        ),
      ],
    );
  }
}
