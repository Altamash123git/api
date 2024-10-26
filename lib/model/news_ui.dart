import 'dart:convert';

import 'package:api/model/news_api_model.dart';
import 'package:api/model/newsmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as webClient;

class NewsUi extends StatefulWidget {
  const NewsUi({super.key});

  @override
  State<NewsUi> createState() => _NewsUiState();
}

class _NewsUiState extends State<NewsUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: getNews(), builder: (_,snapshots){
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
        if(snapshots.hasData==null){
    return Text("Data Not Foumd!!");
    }
          return ListView.builder(
              itemCount: snapshots.data!.articles!.length,
              itemBuilder: (_,i){
                return ListTile(
                  title: Text("${snapshots.data!.articles![i].content}"),
                  subtitle: Text("${snapshots.data!.totalResults}"),
                );
              });
      }),
    );
  }
  Future<MainNewsData?> getNews() async{

    var response= await webClient.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2024-09-25&sortBy=publishedAt&apiKey=dea9bdab1cbb48f0ae96064fe1b2dd09"));
    print(response.statusCode);
    if(response.statusCode==200){
      var data=jsonDecode(response.body) ;
      return MainNewsData.fromJson(data);
    /* Map<String,dynamic>responsedata=jsonDecode(response.body);
     NewsModel newsModel=NewsModel.fromJson(responsedata);
     return newsModel;*/
    }
  }
}
