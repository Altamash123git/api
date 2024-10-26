import 'dart:convert';

class quotesModel{
  int id;
  String quote;
  String author;
  quotesModel({required this.id, required this.quote, required this.author});

  factory quotesModel.fromjson(Map<String,dynamic> json){
return quotesModel(id: json["id"], quote:json["quote"], author: json["author"]);

  }
}


class Datamodel{
  int limit;
  int skip;
  int total;
  List<quotesModel> quotes;

  Datamodel({required this.limit, required this.skip,required this.total,required this.quotes});

factory Datamodel.fromjson(Map<String,dynamic> json){
  List <quotesModel> mQuotes=[];

  for(Map<String, dynamic> eachMap in json['quotes']){
    mQuotes.add(quotesModel.fromjson(eachMap));
  }

  return Datamodel( limit: json['limit'],
      skip: json['skip'],
      total: json['total'],
      quotes: mQuotes);

}
}