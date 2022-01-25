import 'package:drawermenu/screens/fruit_detail_page.dart';
import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:drawermenu/models/fruit_data_model.dart';
//import 'package:drawermenu/models/menu_item.dart';

class PaymentPage extends StatelessWidget{
  // * fruits names
  static List<String> fruitname =['Apple','Banana','Mango','Orange','pineapple'];
  // * fruits images
  static List url = ['https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
      'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
      'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
      'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];
  final List<FruitDataModel> fruitData = 
  List.generate(fruitname.length, (index) => 
  FruitDataModel(fruitname[index], url[index], "${fruitname[index]} description"));

  PaymentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Payment Page"),
      leading: const MenuWidget(),
      ),
      body: ListView.builder(
        itemCount: fruitData.length,
        itemBuilder: 
          (context,index){
            return Card(
              child: ListTile(
                title: Text(fruitData[index].name),
                leading: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    fruitData[index].imageUrl
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
            );
          }
        ),
  );
}