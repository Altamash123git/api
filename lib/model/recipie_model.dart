class recipieModel{
  int? id;
  num?  caloriesPerServing;
  num? cookTimeMinutes;
  String?  cuisine;
  String? difficulty;
  String? image;
  num? prepTimeMinutes;
  num? rating;
  num? reviewCount;
  num? servings;
  List? tags;
  int? userId;
  String? name;
  List? ingredients;
  List? instructions;
  List? mealType;
  recipieModel({
    required this.tags,required this.id,required this.rating,required this.userId,required this.caloriesPerServing,required this.cookTimeMinutes,required this.cuisine,required this.difficulty,required this.image,required this.ingredients,
  required this.instructions,required this.mealType,required this.name,required this.prepTimeMinutes,required this.reviewCount,required this.servings
});
  factory recipieModel.fromMap(Map<String,dynamic> json){
    return recipieModel(tags: json["tags"], id: json["id"], rating: json["rating"], userId: json["userId"], caloriesPerServing: json["caloriesPerServing"], cookTimeMinutes: json["cookTimeMinutes"], cuisine: json["cuisine"],
        difficulty: json["difficulty"], image: json["image"],
        ingredients: json["ingredients"], instructions: json["instructions"], mealType: json["mealType"], name: json["name"], prepTimeMinutes: json["prepTimeMinutes"], reviewCount:json[" reviewCount"], servings: json["servings"]);

  }

}
class mainDataModel{
  List<recipieModel>? recipes;
  int? total;
  int? skip;
  int? limit;
  mainDataModel({required this.total, required this.limit,required this.skip, required this.recipes});
 factory mainDataModel.fromJson(Map<String,dynamic> json){
   List<recipieModel> recipes=[];
   for(Map<String,dynamic> eachdata in json["recipes"]){
     recipes.add(recipieModel.fromMap(eachdata));
   }
   return mainDataModel(total: json["total"], limit: json["limit"], skip: json["skip"], recipes: recipes);
 }

 }
