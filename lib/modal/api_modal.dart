class Products {
  int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;

  Products({
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
  });

  factory Products.fromdata({required Map data}) => Products(
        id: data["id"],
        title: data["title"],
        description: data["description"],
        price: data["price"],
        discountPercentage: data["discountPercentage"]?.toDouble(),
        rating: data["rating"]?.toDouble(),
        stock: data["stock"],
        brand: data["brand"] ?? '',
        category: data["category"],
        thumbnail: data["thumbnail"],
      );

  Map<String, dynamic> todata() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
      };
}
