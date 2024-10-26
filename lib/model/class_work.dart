import 'dart:convert';

class  datamodel{
  int id;
  String avatar;
  String email;
  String first_name;
  String last_name;
  datamodel({required this.id, required this.email, required this.avatar,required this.first_name,required this.last_name});

  factory datamodel.fromjson(Map<String,dynamic>json){

    return datamodel(id: json["id"], email: json["email"], avatar:json["avatar"], first_name:json["first_name"], last_name: json["last_name"]);

  }

}
class supportModel{
  String url;
  String text;
  supportModel({required this.url,required this.text});

  factory supportModel.fromJson(Map<String,dynamic>json){
    return supportModel(url: json["url"], text:json["text"]);

  }
}
class mainData{
  int page;
  int per_page;
  int total;
  int total_pages;
  List<datamodel> data;
  supportModel support;
  //Map<supportModel,> support;
  //var support;
  mainData({required this.data, required this.total, required this.page, required this.per_page,required this.total_pages, required this.support});

  factory mainData.fromJson(Map<String,dynamic>json){
    List<datamodel> data=[];
    //List<supportModel > support=[];
    supportModel support = supportModel.fromJson(json['support']);
    //support.add(supportModel.fromJson(json["support"]));
    for (Map<String, dynamic> eachMap in json["data"]){

      data.add(datamodel.fromjson(eachMap));
    }
  /*  for(Map<String, dynamic> eachMap in json["support"]){
      support.add(supportModel.fromJson(eachMap));
    }*/

    return mainData(data: data, total: json["total"], page: json["page"], per_page: json["per_page"], total_pages: json["total_pages"],support:support);

  }
}