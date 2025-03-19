import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemImage;
  final MaterialColor color;
  final void Function()? onPressed;
  const GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.color,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(itemImage, height: 64),

            Text(itemName, style: TextStyle(fontSize: 16)),

            MaterialButton(
              onPressed: onPressed,
              color: color.shade500,
              child: Text(
                '\$$itemPrice',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
