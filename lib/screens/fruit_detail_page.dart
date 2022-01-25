import 'package:drawermenu/models/fruit_data_model.dart';
import 'package:flutter/material.dart';

class FruitDetail extends StatelessWidget {
  final FruitDataModel fruitDataModel;
  const FruitDetail({ Key? key, required this.fruitDataModel }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
        title: Text(fruitDataModel.name),
      ),
      body: Column(
        children: [
          Image.network(fruitDataModel.imageUrl),
          Text(fruitDataModel.desc)
        ],
      ),
  );
}