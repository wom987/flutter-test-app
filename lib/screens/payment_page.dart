import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';
//import 'package:drawermenu/models/menu_item.dart';

class PaymentPage extends StatelessWidget{
  const PaymentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Payment Page"),
      leading: const MenuWidget(),
      ),
  );
}