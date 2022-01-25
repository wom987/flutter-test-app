import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget{
  const AboutUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.redAccent,
      title: const Text("About Us"),
      leading: const MenuWidget(),
      ),
  );
}