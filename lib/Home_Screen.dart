import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/basketScreen.dart';
import 'package:fruits_ecommerce_app/favorite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(20),
            child: Column(
              children: [
                 SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Icon(Icons.menu, color: Colors.black, size: 36),
                    Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteScreen()));
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
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>BasketScreen()));
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello Shaon, What fruit salad \ncombo do you want today?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextField(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 230, 229, 229),
                    hintText: "Search for fruit salad combos ",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 100, 99, 99),
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Recommended Combo?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildComboCard2(
                      "Honey lime combo",
                      "assets/images/f4.png",
                      "\$2000",
                      true,
                    ),
                    buildComboCard2(
                      "Honey lime combo",
                      "assets/images/f7.png",
                      "\$2000",
                      false,
                    ),
                  ],
                ),

                // TabBar + TabBarView
                TabBar(
                  isScrollable: true,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.orange,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: "Hottest"),
                    Tab(text: "Popular"),
                    Tab(text: "New combo"),
                    Tab(text: "Top"),
                  ],
                ),
                SizedBox(height: 6,),
                Expanded(
                  child: TabBarView(
                    children: [
                      //  1st Tab Content
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildComboCard1(
                            "Quinoa fruit salad",
                            "assets/images/f5.png",
                            "\$2000",
                            false,
                          ),
                          buildComboCard1(
                            "Quinoa fruit salad",
                            "assets/images/f6.png",
                            "\$2000",
                            false,
                          ),
                        ],
                      ),

                      // 2nd Tab Content
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 150,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            
                          ),
                          Container(
                            height: 150,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            
                          ),
                        ],
                      ),

                      // ⚙️ 3rd Tab Content
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 150,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            
                          ),
                          Container(
                            height: 150,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                      //4th Tab Content
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 150,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),

                          ),
                          Container(
                            height: 150,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
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

Widget buildComboCard2(
  String title,
  String imagePath,
  String price,
  bool isFavorite,
) {
  return Container(
    height: 188,
    width: 152,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 230, 229, 229),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [BoxShadow(color: Colors.white54, offset: Offset(2, 2))],
    ),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 42.0),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.amber,
            size: 24,
          ),
        ),
        Positioned(
          top: 120,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(color: Colors.amber, fontSize: 20),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildComboCard1(
  String title,
  String imagePath,
  String price,
  bool isFavorite,
) {
  return Container(
    height: 170,
    width: 140,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 230, 229, 229),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [BoxShadow(color: Colors.white54, offset: Offset(2, 2))],
    ),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 100,
              height: 70,
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 5,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.amber,
            size: 24,
          ),
        ),
        Positioned(
          top: 80,
          left: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(color: Colors.amber, fontSize: 20),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
