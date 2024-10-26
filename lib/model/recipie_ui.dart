import 'dart:convert';

import 'package:api/model/recipie_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class RecipieUi extends StatefulWidget {
  const RecipieUi({super.key});

  @override
  State<RecipieUi> createState() => _RecipieUiState();
}

class _RecipieUiState extends State<RecipieUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:  FutureBuilder(future: getRecipie(), builder: (c,snapshots){
  if(snapshots.connectionState==ConnectionState.waiting){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  if(snapshots.hasError){
    return Center(
      child: Text("Error: ${snapshots.error}"),
    );
  }
  if(snapshots.hasData){
    return snapshots.data!=null?snapshots.data!.recipes!.isNotEmpty?
        ListView.builder(
            itemCount: snapshots.data!.recipes!.length,
            itemBuilder: (c,i){
          return ListTile(
            title: Text("${snapshots.data!.recipes![i].name}"),
          );
        })
        :Center(child: Text("recipe not found"),) :Center(child: Text('Data not recieved'),);
  }
  return Container();
}),
    );
  }
Future<mainDataModel?>  getRecipie() async{
    var response= await http.get(Uri.parse("https://dummyjson.com/recipes"));
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      return mainDataModel.fromJson(data);
    }

}
}
