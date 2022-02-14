import 'dart:ui';

import 'package:drawermenu/models/menu_item.dart';
import 'package:drawermenu/screens/about_us.dart';
import 'package:drawermenu/screens/help.dart';
import 'package:drawermenu/screens/notifications.dart';
import 'package:drawermenu/screens/promos.dart';
import 'package:drawermenu/screens/rate_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:drawermenu/screens/payment_page.dart';
import 'package:drawermenu/screens/menu_page.dart';
import 'package:drawermenu/utils/constants.dart';
Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme:  ThemeData(
        primaryColor: colorWhite,
        textTheme: screenWidth<500?textThemeSmall:textThemeDefault, 
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MenuItem currentItem = MenuItems.payment;
  
  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) => ZoomDrawer(
    // * screen border radious
    borderRadius: 40,
    // * screen angle 
    angle: -5,
    // * it determines the translation for the screen 
    slideWidth: MediaQuery.of(context).size.width*0.7,
    // * shadow allowed to have a color
    showShadow: true,
    // * shadow color
    backgroundColor: Colors.purpleAccent,
    // * drawer styles
    style: DrawerStyle.Style1,
    // ignore: prefer_const_constructors
    // calling the screen selected
    mainScreen: getScreen(),
    // * this builder allows to close the zoom drawer and change the state and send the selected item
    menuScreen: Builder(
      builder: (context)=>
        MenuPage(
          currentItem:currentItem,
          onSelectedItem:(item){
            setState(()=>currentItem=item);
            ZoomDrawer.of(context)!.close();
          },
          
        )
    ),

  );
  // * it displays the current page
  Widget getScreen(){
    switch (currentItem) {
      case MenuItems.payment:
          return  const PaymentPage();
      case MenuItems.notifications:
          return const Notifications();
      case MenuItems.promos:
          return const Promos();
      case MenuItems.help:
          return const Help();
      case MenuItems.aboutUs:
          return const AboutUs();
      default:
          return const RateUs();
    }
  }
}
