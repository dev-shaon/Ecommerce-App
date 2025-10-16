import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {


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
                "My Favorite",
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
