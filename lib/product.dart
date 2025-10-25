class Product {
  final int id;
  final String title;
  final String imageUrl;
  final String price;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
}
