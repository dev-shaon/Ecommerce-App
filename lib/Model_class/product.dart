class Product {
  final int id;
  final String title;
  final String imageUrl;
  final double price;
  bool isFavorite;
  final int catagoryId;
  final bool isRecommendet;

  Product( {
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
    required this.catagoryId,
     this.isRecommendet=false,
  });
}
List<Product> basketItems = [];
