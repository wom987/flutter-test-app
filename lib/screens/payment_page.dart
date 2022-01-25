import 'package:drawermenu/screens/fruit_detail_page.dart';
import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:drawermenu/models/fruit_data_model.dart';
//import 'package:drawermenu/models/menu_item.dart';

class PaymentPage extends StatelessWidget{
  // * fruits names
  static List<String> fruitname =[
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'pineapple',
    'Apple test',
    'Banana test',
    'Mango test',
    'Orange test',
    'pineapple test'];
  // * fruits images
  static List url = [
      'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
      'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
      'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
      'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg',
      'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
      'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
      'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
      'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];
  final List<FruitDataModel> fruitData = 
  List.generate(fruitname.length, (index) => 
  FruitDataModel(fruitname[index], url[index], "${fruitname[index]} description"));
  
  PaymentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title:  Text("Payment Page",style: themeData.textTheme.headline2,),
      leading: const MenuWidget(),
      ),
      body: ListView.builder(
        itemCount: fruitData.length,
        itemBuilder: 
          (context,index){
            return Padding(
              padding: const EdgeInsets.all(15),
              child: 
                  Card(
                    margin: const EdgeInsets.all(1),
                    color: Colors.white,
                    shadowColor: Colors.pinkAccent,
                    child: 
                      ListTile(
                      title: Text(fruitData[index].name, style: themeData.textTheme.headline3,),
                      subtitle:
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: 
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [ 
                                const SizedBox(
                                  width: 10,
                                ),
                                  Image.network(
                                    fruitData[index].imageUrl,
                                    width: 100,
                                    height: 150,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.network(
                                    fruitData[index].imageUrl,
                                    width: 100,
                                    height: 150,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.network(
                                    fruitData[index].imageUrl,
                                    width: 100,
                                    height: 150,
                                )
                            ],
                          ),
                          ),
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>FruitDetail( fruitDataModel: fruitData[index],)
                            )
                        );
                      },
                    ),
                      ),
                );
          }
        ),
  );
  }
}