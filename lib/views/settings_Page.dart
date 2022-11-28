
import 'package:flutter/material.dart';
import 'package:youlibv1/widget/listSettings.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[400],
            centerTitle: true, title: const Text("Ajustes")
        ),

      body: ListSettings(),

    );
  }
}


