class reviewsmodel{
num rating;
String? comment;
String? date;
String? reviewerEmail;
String? reviewerName;
reviewsmodel({required this.rating, required this.date,required this.comment,required this.reviewerEmail,required this.reviewerName});


factory reviewsmodel.fromJson(Map<String,dynamic> json){

  return reviewsmodel(rating:json["rating"], date: json["date"], comment:json["comment"], reviewerEmail: json["reviewerEmail"], reviewerName: json["reviewerName"]);
}
}
double parseToDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else if (value is String) {
    return double.tryParse(value) ?? 0.0; // Fallback to 0.0 or handle appropriately
  }
  return 0.0;
}
class  dimensionsModel{
  num width;
  num height;
num  depth;
 dimensionsModel({
    required this.width,required this.height,required this.depth
});
 factory dimensionsModel.fromJson(Map<String,dynamic> json){
   return dimensionsModel(width: json["width"], height: json["height"], depth: json["depth"]);

 }
}
class metaModel{
  String?  barcode;
  String? createdAt;
  String? qrCode;
  String? updatedAt;
  metaModel({
    required this.barcode, required this.createdAt, required this.qrCode, required this.updatedAt
});
factory metaModel.fromJson(Map<String,dynamic> json){
  return metaModel(barcode: json["barcode"], createdAt:json["createdAt"], qrCode:json["qrCode"], updatedAt:json["updatedAt"]);
}
}


class productModel{
  String? availabilityStatus;
  String? brand;
  String? category;
  String? description;
  num price;
  num discountPercentage;
  num rating;
  num stock;
  int id;
  num  minimumOrderQuantity;
  String? returnPolicy;
  String? shippingInformation;
  String?  thumbnail;
  String? sku;
  String? title;
  String? warrantyInformation;
  num weight;
  List<dynamic> tags;
  List<dynamic> images;
  List<reviewsmodel> reviews;
 dimensionsModel dimensions;
  metaModel meta;
  productModel({ required this.dimensions,required this.id, required this.rating, required this.title, required this.meta, required this.category ,required this.availabilityStatus,
  required this.brand, required this.description, required this.discountPercentage, required this.images, required this.minimumOrderQuantity, required this.price, required this.returnPolicy, required this.reviews, required this.shippingInformation, required this.sku, required this.stock, required this.tags,
  required this.thumbnail, required this.warrantyInformation, required this.weight


  });

factory productModel.fromJson(Map<String,dynamic> json){
  List<reviewsmodel> mreviews=[];
  for(Map<String, dynamic> eachMap in json["reviews"]){
    mreviews.add(reviewsmodel.fromJson(eachMap));
  }
  //reviewsmodel mreviews= reviewsmodel.fromJson(json["reviews"]);
  dimensionsModel mdimension=dimensionsModel.fromJson(json["dimensions"]);
  metaModel mmeta= metaModel.fromJson(json["meta"]);

  return productModel(dimensions:mdimension, id: json["id"], rating: json["rating"], title: json["title"], meta:mmeta, category: json["category"],
      availabilityStatus:json["availabilityStatus"], brand: json["brand"],
      description:json["description"], discountPercentage: json["discountPercentage"],
      images: json["images"], minimumOrderQuantity:json["minimumOrderQuantity"],
      price:json["price"], returnPolicy: json["returnPolicy"], reviews: mreviews,

      shippingInformation: json["shippingInformation"], sku:json["sku"], stock: json["stock"],
      tags: json["tags"], thumbnail: json["thumbnail"],
      warrantyInformation:json["warrantyInformation"], weight: json["weight"]);

}

}

class mainDataModel{

  num total;
  num skip;
  num limit;
  List<productModel> products;
  mainDataModel({required this.total, required this.skip, required this.limit, required this.products});

  factory mainDataModel.fromJson(Map<String,dynamic> json){
    List<productModel> products=[];

      for (Map<String, dynamic> eachMap in json["products"]) {
        products.add(productModel.fromJson(eachMap));

    }
    /* for(Map<String, dynamic> eachMap in json["products"]){
      products.add(productModel.fromJson(eachMap));
    }*/
    return mainDataModel(total: json["total"], skip: json["skip"], limit: json["limit"], products: (json["products"] as List)
        .map((product) => productModel.fromJson(product))
        .toList(),);


  }
}