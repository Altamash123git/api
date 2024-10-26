import 'dart:convert';

import 'package:api/model/class_work.dart';
import 'package:api/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as webClient;
class classworkData extends StatefulWidget {
  const classworkData({super.key});

  @override
  State<classworkData> createState() => _classworkDataState();
}

class _classworkDataState extends State<classworkData> {
  mainData? mdata;
  @override
  initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  mdata!=null? mdata!.data.isNotEmpty? ListView.builder(
          itemCount: mdata!.data.length,
          itemBuilder:(_,i){
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(mdata!.data[i].avatar),),
            //trailing: Text(mdata.data[i].),
            title: Text("${mdata!.data[i].first_name } ${mdata!.data[i].last_name}"),
          ),
        );
      }):Center(child: Text("data not found"),):Center(child: Text("data not fetched"),),
    );
  }
  getData() async{
    String url= "https://reqres.in/api/users?page=2";
    webClient.Response response= await webClient.get(Uri.parse(url));
   
   print(response.statusCode);
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      mdata= mainData.fromJson(data);
      setState(() {

      });
    }
  }
}

/*
class QuotesData extends StatefulWidget {
  //constQuotesData({super.key});

  @override
  State<QuotesData> createState() =>  _QuotesDataState();
}

class _QuotesDataState extends State<QuotesData> {
  Datamodel? mdata;

  @override
  initState() {
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(

     body:mdata!=null? mdata!.quotes.isNotEmpty?ListView.builder(
         itemCount: mdata!.quotes.length,
         itemBuilder:(c,index){

       return Card(
         child: ListTile(

           title:  Text(mdata!.quotes[index].quote),
         ),
       );
     }):Center(child: Text('No Quotes found!!'),):Center(child: Text("Data not rcieved"),) ,
   );
  }
  getQuotes () async{
    String url= "https://dummyjson.com/quotes";
    webClient.Response response=await webClient.get(Uri.parse(url));
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      mdata= Datamodel.fromjson(data);
      setState(() {

      });
    }
  }
}
*/
