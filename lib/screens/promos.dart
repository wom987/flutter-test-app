import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';
//import 'package:drawermenu/models/menu_item.dart';

class Promos extends StatelessWidget{
  const Promos({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueGrey,
      title: const Text("Promos"),
      leading: const MenuWidget(),
      ),
  );
}