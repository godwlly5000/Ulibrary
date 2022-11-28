import 'package:flutter/material.dart';

class Record_Page extends StatefulWidget {
  const Record_Page({Key? key}) : super(key: key);

  @override
  State<Record_Page> createState() => _Record_PageState();
}

class _Record_PageState extends State<Record_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
      ),
    );
  }
}
