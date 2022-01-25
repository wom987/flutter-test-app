import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';
//import 'package:drawermenu/models/menu_item.dart';

class Help extends StatelessWidget{
  const Help({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.greenAccent,
      title: const Text("Help"),
      leading: const MenuWidget(),
      ),
  );
}