import 'package:flutter/material.dart';
import '../Model_class/product.dart';

class FavoriteProvider extends ChangeNotifier {


  final List<Product> _favoriteItems = [];

  List<Product> get favoriteProduct => _favoriteItems;

  bool isFavorite(Product product) {
    return _favoriteItems.contains(product);
  }

  void addFavorite(Product product) {
    _favoriteItems.add(product);
    notifyListeners();
  }

  void removeFavorite(Product product) {
    _favoriteItems.remove(product);
    notifyListeners();
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      removeFavorite(product);
    } else {
      addFavorite(product);
    }
  }
}

