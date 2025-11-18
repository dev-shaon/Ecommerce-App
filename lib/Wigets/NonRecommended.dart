import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Wigets/multiproduct.dart';
import 'package:fruits_ecommerce_app/Model_class/product.dart';
import 'package:fruits_ecommerce_app/Provider/provider.dart';
import 'package:provider/provider.dart';

class NonRecommendedGrid extends StatelessWidget {
  final List<Product> products;

  const NonRecommendedGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.4,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        final isFav = favoriteProvider.isFavorite(product);
        return MultipleProduct(
          product: product,
          isFavorite: isFav,
          onFavoritePressed: () {
            favoriteProvider.toggleFavorite(product);
          },
        );
      },
    );
  }
}
