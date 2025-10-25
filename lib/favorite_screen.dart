import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteProducts = favoriteProvider.favoriteProduct;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Items",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: favoriteProducts.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                  SizedBox(height: 15),
                  Text("No favorite items yet!",
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6),
                  child: ListTile(
                    leading: Image.asset(product.imageUrl,
                        width: 50,
                        height: 50, 
                        fit: BoxFit.cover
                        ),
                    title: Text(
                      product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold)),
                    subtitle: Text(product.price,
                        style: const TextStyle(
                          color: Colors.orange
                          )),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.favorite, 
                        color: Colors.orange),
                      onPressed: () {
                        favoriteProvider.toggleFavorite(product);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
