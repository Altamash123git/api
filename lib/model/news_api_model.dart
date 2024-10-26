class SourceModel{
  String? id;
  String? name;
  SourceModel({required this.name, required this.id});
factory SourceModel.fromJson(Map<String,dynamic>json){
  return SourceModel(name: json["name"], id: json["id"]);
}

  }
class  articlesdata{
  String? author;
  String? content;
  String? description;
  String? publishedAt;
  SourceModel? source;
  String? title;
  String? url;
  String? urlToImage;
  articlesdata({required this.url,required this.description,required this.title,required this.author,required this.content,required this.publishedAt,
  required this.urlToImage,required this.source
  });
factory articlesdata.fromJson(Map<String,dynamic> json){
  return articlesdata(url: json["url"], description: json["description"],
      title: json["title"], author:json["author"], content: json["content"],
      publishedAt: json["publishedAt"], urlToImage:json["urlToImage"], source: json["source"] != null ? SourceModel.fromJson(json["source"]) : null);
}

}
class MainNewsData{
  String? status;
  num? totalResults;
  List<articlesdata>? articles;
  MainNewsData({required this.status,required this.totalResults,required this.articles});
  factory MainNewsData.fromJson(Map<String,dynamic> json){
    /*var articlesList = json["articles"] as List?; // Safely access articles list
    List<articlesdata> articles = articlesList != null
        ? articlesList.map((article) => articlesdata.fromJson(article)).toList()
        : [];*/
    List<articlesdata>? articles=[];
    if(json["articles"]==null){
    articles=[];
    }else{
      for(Map<String,dynamic> eacharticles in json["articles"]){
        articles!.add(articlesdata.fromJson(eacharticles));
      }

    }


    return MainNewsData(status: json["status"], totalResults: json["totalResults"], articles: articles);
  }
}