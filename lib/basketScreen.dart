import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              alignment: Alignment.center, 
              decoration:  BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                "My Basket",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Container(
                  height: 80,
                  width: 340,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey
                  ),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}