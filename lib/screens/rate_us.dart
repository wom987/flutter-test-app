import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';

class RateUs extends StatelessWidget{
  const RateUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.purple,
      title: const Text("Rate Us"),
      leading: const MenuWidget(),
      ),
  );
}