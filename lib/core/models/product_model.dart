class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final double rating;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    required this.isFavorite,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: (json["price"] as num).toDouble(),
      rating: (json["rating"] as num).toDouble(),
      isFavorite: json["isFavorite"],
    );
  }
}
