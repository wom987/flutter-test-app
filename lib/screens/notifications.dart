import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget{
  const Notifications({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.brown,
      title: const Text("Notifications"),
      leading: const MenuWidget(),
      ),
  );
}