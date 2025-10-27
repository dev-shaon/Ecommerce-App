import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Screens/basket_screen.dart';
import 'package:fruits_ecommerce_app/Screens/favorite_screen.dart';
import 'package:fruits_ecommerce_app/Wigets/NonRecommended.dart';
import 'package:fruits_ecommerce_app/Wigets/productcard.dart';
import 'package:fruits_ecommerce_app/catagory_details.dart';
import 'package:fruits_ecommerce_app/provider.dart';
import 'package:provider/provider.dart';
import '../product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int selectedcata = 1;

  final List<Category> categorys = [
    Category(id: 1, name: 'Hottest'),
    Category(id: 2, name: "Popular"),
    Category(id: 3, name: "New combo"),
    Category(id: 4, name: "Top"),
  ];

  // list of products
  final List<Product> products = [
    Product(
      id: 1,
      title: "Cappuccino",
      imageUrl: "assets/images/f4.png",
      price: 4.99,
      catagoryId: 1,
      isRecommendet: true,
    ),
    Product(
      id: 2,
      title: "Fruit Salad",
      imageUrl: "assets/images/f5.png",
      price: 6.99,
      catagoryId: 1,
      isRecommendet: true,
    ),
    Product(
      id: 3,
      title: "Green Salad",
      imageUrl: "assets/images/f4.png",
      price: 10.99,
      catagoryId: 2,
      isRecommendet: false,
    ),
    Product(
      id: 4,
      title: "Italian Salad",
      imageUrl: "assets/images/f5.png",
      price: 6.99,
      catagoryId: 3,
      isRecommendet: false,
    ),
    Product(
      id: 5,
      title: "Caesar Salad",
      imageUrl: "assets/images/f5.png",
      price: 2.99,
      catagoryId: 1,
      isRecommendet: false,
    ),
  ];

  List<Product> getRecomne() {
    return products.where((f) => f.isRecommendet == true).toList();
  }

  List<Product> getCatagoryProduct(int catId) {
    return products.where((f) => f.catagoryId == catId).toList();
  }

  @override
  Widget build(BuildContext context) {

    final recomendetProduts = getRecomne(); //////////////////////////////////////////////////////////////only recommended

    final nonRecomendetProducts = products.where((f) => f.isRecommendet == false).toList(); ///////////// only non-recommended

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
                    Row(children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.sort,size: 40,))
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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

                ////////////////////////////////////////////////////////////////////////////// Only recommended products
                Flexible(
                  child: GridView.builder(
                    itemCount: recomendetProduts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3 / 4,
                        ),
                    itemBuilder: (context, index) {
                      final product = recomendetProduts[index];
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

                ///////////////////////////////////////////////////////////////////////////////// Only nonRecommended products tabs
                Expanded(
                  child: TabBarView(
                    children: [
                      NonRecommendedGrid(products: nonRecomendetProducts),
                      NonRecommendedGrid(products: recomendetProduts),
                      NonRecommendedGrid(products: nonRecomendetProducts),
                      NonRecommendedGrid(products: nonRecomendetProducts),
                    ],
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
