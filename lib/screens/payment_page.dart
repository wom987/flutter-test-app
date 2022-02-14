import 'dart:convert';
import 'package:drawermenu/models/stickers_model.dart';
import 'package:drawermenu/screens/fruit_detail_page.dart';
import 'package:drawermenu/utils/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//import 'package:drawermenu/models/menu_item.dart';
import 'package:http/http.dart' as http;

class PaymentPage extends StatelessWidget{
   
  const PaymentPage({Key? key}) : super(key: key);

  Future<Welcome> fetchStickers() async {
  var url =dotenv.env['API_URL'].toString();
  final response = await http
      .get(Uri.parse(url));

  if (response.statusCode == 200) {
    Welcome stickerData = Welcome.fromJson(jsonDecode(response.body));
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return stickerData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

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
      body: 

      FutureBuilder<Welcome>(
        future: fetchStickers(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return  
            ListView.builder(
              itemCount: snapshot.data!.records.length,
              itemBuilder: 
                (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: 
                        Card(
                          margin: const EdgeInsets.all(1),
                          color: Colors.white,
                          shadowColor: Colors.grey,
                          child: 
                          GestureDetector(
                            child:  
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Column(
                                children:[ 
                                  Row(
                                    children: [
                                    Text(
                                      snapshot.data!.records[index].fields.name+'  ',
                                      style: themeData.textTheme.headline3
                                      ),
                                      const Icon(Icons.play_circle_fill_outlined),
                                  ]
                                  ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[ 
                                            for (int i=0; i<3; i++)
                                              Row(
                                                children:  [
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Image.network(
                                                    snapshot.data!.records[index].fields.stickers[i].url,
                                                    width: 110,
                                                    height: 100,
                                                )
                                                ],
                                              )            
                                            ],
                                          ),
                                  ]
                                )
                            ),
                          onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context)=>FruitDetail( fruitDataModel: snapshot.data!, index: index,)
                                  )
                              );
                            },
                          )
                            ),
                      );
                }
              );
          }else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        })
      
  );
  }
  
}
//displaying 3 images 