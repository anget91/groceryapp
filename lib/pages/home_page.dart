import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/components/grocery_item_tile.dart';
import 'package:groceryapp/models/cart_model.dart';
import 'package:groceryapp/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CartPage();
                },
              ),
            ),
        backgroundColor: Colors.black,
        shape: CircleBorder(),
        child: Icon(Icons.shopping_bag, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Good Morning,"),
            ),

            SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Fresh Items", style: TextStyle(fontSize: 16)),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder:
                    (context, value, child) => GridView.builder(
                      itemCount: value.shopItems.length,
                      padding: EdgeInsetsDirectional.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          itemImage: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<CartModel>(
                              context,
                              listen: false,
                            ).addItemToCart(index);
                          },
                        );
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
