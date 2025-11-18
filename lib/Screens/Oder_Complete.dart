import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Screens/Delivery_Status_scren.dart';
import 'package:fruits_ecommerce_app/Screens/Home_Screen.dart';

class OderComplete extends StatelessWidget {
  const OderComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/oder.png"), height: 500),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(200, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryStatusScren()),
                );
              },
              child: Text(
                "Track order",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 46),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 80,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Continue shopping",
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
}
