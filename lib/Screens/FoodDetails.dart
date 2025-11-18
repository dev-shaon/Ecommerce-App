import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Screens/basket_screen.dart';
import '../Model_class/product.dart';

class FoodDetails extends StatefulWidget {
  final Product product;

  const FoodDetails({super.key, required this.product});

  @override
  State<FoodDetails> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<FoodDetails> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  label: const Text(
                    "Go back",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),

            Hero(
              tag: widget.product.id,
              child: Image.asset(
                widget.product.imageUrl,
                height: 160,
                width: 160,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 40),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 33),

                        // Counter
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                _quantityButton(Icons.remove, () {
                                  if (count > 1) {
                                    setState(() {
                                      count--;
                                    });
                                  }
                                }),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Text(
                                    "$count",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                _quantityButton(Icons.add, () {
                                  setState(() {
                                    count++;
                                  });
                                }),
                              ],
                            ),
                            Text(
                              "₦ ${(widget.product.price * count).toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 64),

                        // Description
                        const Text(
                          "One Pack Contains:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        const SizedBox(height: 44),
                        const Text(
                          "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you.",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),

                        const SizedBox(height: 66),

                        // Add to Basket Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 28, // background size
                              backgroundColor: Colors.orange.withOpacity(0.2),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                  color: Colors.orange,
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                basketItems.add(
                                  widget.product,
                                ); // ✅ Add product in basket

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      "${widget.product.title} added to basket",
                                    ),
                                  ),
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BasketScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                minimumSize: Size(280, 60),
                              ),
                              child: const Text(
                                "Add to basket",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Quantity Button Widget
  Widget _quantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.orange),
        onPressed: onPressed,
      ),
    );
  }
}
