import 'dart:convert';

import 'package:api/model/productsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as webClient;
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  mainDataModel? mData;
  @override
  initState() {
    super.initState();
    getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: mData!=null?mData!.products.isNotEmpty?ListView.builder(
          itemCount: mData!.products.length,
          itemBuilder: (_,index){
        return Card(
          child: ListTile(
            title: Text(mData!.products[index].tags[0]),
          ),
        );
      }):Center(child: Text("data not get"),):Center(child: Text("Data not fetched"),

     /* ListView.builder(
          itemCount: mData!.products.length,
          itemBuilder: (c,i){
            return ListTile(
              title: Text(mData!.products[i].warrantyInformation),
            );
        
      }),),*/
    ));
  }
  getProducts() async{
      String url= "https://dummyjson.com/products";
    webClient.Response response= await webClient.get(Uri.parse(url));
    print(response.statusCode);
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      print(json);
      print("i am $data");
      mData=mainDataModel.fromJson(data);

      print("mdata is $mData");
      print(mData!.products.length);
      setState(() {

      });

    }

  }
}
