import 'package:flutter/material.dart';

class DeliveryStatusScren extends StatelessWidget {
  const DeliveryStatusScren({super.key});

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

            const SizedBox(height: 20),
            const Text(
              "Delivery Status",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            //Container for List
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image(
                              image: AssetImage("assets/images/pen.png"),
                            ),
                          ),
                          Text(
                            "Order Taken",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            radius: 26,
                            child: Image(
                              image: AssetImage("assets/images/right.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image(
                              image: AssetImage("assets/images/shopp.png"),
                            ),
                          ),
                          Text(
                            "Order Is Being Prepared",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            radius: 26,
                            child: Image(
                              image: AssetImage("assets/images/right.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Image(
                              image: AssetImage("assets/images/baike.png"),
                            ),
                          ),
                          Text(
                            "Order Is Being Delivered",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            child: Image(
                              image: AssetImage("assets/images/call.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Image(image: AssetImage("assets/images/map.png")),

                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            child: Image(
                              image: AssetImage("assets/images/right.png"),
                            ),
                          ),

                          Text(
                            "Order Is Being Delivered",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image(image: AssetImage("assets/images/dot.png")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
