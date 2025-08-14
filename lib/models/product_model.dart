class ProductModel {
  final int? id;
  final String? title;
  final String? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingModel? rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.formJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final String? rating;
  final String? count;

  RatingModel({required this.rating, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rating: (jsonData != null)? jsonData['rating'].toString() : 'no rating',
      count: (jsonData != null)?jsonData['count'].toString(): 'no count',
    );
  }
}
