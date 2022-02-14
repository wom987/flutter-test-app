import 'package:drawermenu/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:drawermenu/models/stickers_model.dart';

class FruitDetail extends StatelessWidget {
  
  final Welcome fruitDataModel;
  final int index;
  const FruitDetail({
    Key? key,
    required this.fruitDataModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
        title: Text(fruitDataModel.records[index].fields.name,style: textThemeDefault.headline2),
      ),
      body:
      
              GridView.extent(maxCrossAxisExtent: 150,
          padding: const EdgeInsets.all(4),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          scrollDirection: Axis.vertical,
    shrinkWrap: true,
          children: 
          <Widget>[ 
              for (int i=0; i<fruitDataModel.records[index].fields.stickers.length; i++)
                    Image.network(
                    fruitDataModel.records[index].fields.stickers[i].url,
                    width: 110,
                    height: 100,
                    )          
              ],
          )
              
      
  );
}
