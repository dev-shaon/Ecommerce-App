import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Screens/FoodDetails.dart';
import 'package:fruits_ecommerce_app/Screens/basket_screen.dart';
import 'package:fruits_ecommerce_app/Screens/favorite_screen.dart';
import 'package:fruits_ecommerce_app/provider.dart';
import 'package:provider/provider.dart';
import '../product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //list for Recommended food
  final List<Product> products = [
    Product(
      id: 1,
      title: "Cappuccino",
      imageUrl: "assets/images/f4.png",
      price: 4.99,
    ),
    Product(
      id: 2,
      title: "Fruit Salad",
      imageUrl: "assets/images/f5.png",
      price: 6.99,
    ),
  ];

  //list for tabber view
  final List<Product> Mproduct = [
    Product(
      id: 3,
      title: "Green Salad",
      imageUrl: "assets/images/f4.png",
      price: 10.99,
    ),
    Product(
      id: 4,
      title: "Italian  Salad",
      imageUrl: "assets/images/f5.png",
      price: 6.99,
    ),
    Product(
      id: 5,
      title: "Caesar Salad",
      imageUrl: "assets/images/f5.png",
      price: 2.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.black, size: 36),
                    Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FavoriteScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.orange,
                                size: 30,
                              ),
                            ),
                            const Text("Fav"),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BasketScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.shopping_basket,
                                color: Colors.orange,
                                size: 30,
                              ),
                            ),
                            const Text("My basket"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hello Shaon, What fruit salad \ncombo do you want today?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Color.fromARGB(255, 230, 229, 229),
                          hintText: "Search for fruit salad combos",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.tune, size: 40),
                    ),
                  ],
                ),

                const SizedBox(height: 26),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recommended Combo?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 26),

                // GridView use kora
                Flexible(
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3 / 4,
                        ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final isFav = favoriteProvider.isFavorite(product);
                      return ProductCard(
                        product: product,
                        isFavorite: isFav,
                        onFavoritePressed: () {
                          favoriteProvider.toggleFavorite(product);
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),
                TabBar(
                  isScrollable: true,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.orange,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(text: "Hottest"),
                    Tab(text: "Popular"),
                    Tab(text: "New combo"),
                    Tab(text: "Top"),
                  ],
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 4.0,
                      color: Colors.deepOrange,
                    ),
                    insets: EdgeInsets.only(left: 0, right: 20),
                  ),
                ),
                const SizedBox(height: 6),

                Expanded(
                  child: Expanded(
                    child: TabBarView(
                      children: [
                        //1st Tab
                        GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Mproduct.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1.4,
                              ),
                          itemBuilder: (context, index) {
                            final product = Mproduct[index];
                            final isFav = favoriteProvider.isFavorite(product);
                            return MultipleProduct(
                              product: product,
                              isFavorite: isFav,
                              onFavoritePressed: () {
                                favoriteProvider.toggleFavorite(product);
                              },
                            );
                          },
                        ),

                        // 2nd Tab
                        GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                        ),

                        // 3rd Tab
                        GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Mproduct.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1.4,
                              ),
                          itemBuilder: (context, index) {
                            final product = Mproduct[index];
                            final isFav = favoriteProvider.isFavorite(product);
                            return MultipleProduct(
                              product: product,
                              isFavorite: isFav,
                              onFavoritePressed: () {
                                favoriteProvider.toggleFavorite(product);
                              },
                            );
                          },
                        ),

                        //  4th Tab
                        GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 243, 207),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 20,
            bottom: 60,
            child: Center(
              child: Image.asset(
                product.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.orange : Colors.black,
                size: 34,
              ),
              onPressed: onFavoritePressed,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "\$${product.price.toStringAsFixed(2)}", // ✅ Fixed
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 18,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetails(product: product),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    iconSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MultipleProduct extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const MultipleProduct({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 243, 207),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 10,
            bottom: 60,
            child: Center(
              child: Image.asset(
                product.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 7,
            right: 7,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.orange : Colors.black,
                size: 34,
              ),
              onPressed: onFavoritePressed,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "\$${product.price.toStringAsFixed(2)}", // ✅ Fixed
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 18,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetails(product: product),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    iconSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
