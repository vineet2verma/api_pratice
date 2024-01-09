class ProductDataModel {
  num? limit;
  List<ProductModel>? products;
  num? skip;
  num? total;

  ProductDataModel({
      required this.limit,
      required this.products,
      required this.skip,
      required this.total});

  factory ProductDataModel.fromJson(Map<String,dynamic> json){
    List<ProductModel> listProducts = [];
    for(Map<String,dynamic> eachMap in json['products']){
      listProducts.add(ProductModel.fromJson(eachMap));
    }
    return
        ProductDataModel(
            limit : json['limit'],
            products : listProducts,
            skip :json['skip'],
            total : json['total']);
  }
}

class ProductModel {
  String? brand;
  String? category;
  String? description;
  num? discountPercentage;
  int? id;
  List<dynamic>? images;
  int? price;
  num? rating;
  num? stock;
  String? thumbnail;
  String? title;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return
      ProductModel(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          price: json['price'],
          discountPercentage: json['discountPercentage'],
          rating: json['rating'],
          stock: json['stock'],
          brand: json['brand'],
          category: json['category'],
          thumbnail: json['thumbnail'],
          images: json['images']);
  }
}