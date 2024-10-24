import 'package:flutter/material.dart';
import 'package:p1_donut_app_leonardo_bocos/utils/burger_tile.dart';

class BurgerTab extends StatelessWidget {
  final List burgersOnSale = [
// [ burgerFlavor, burgerPrice, burgerColor, imageName ]
    ["Cheeseburger", "50", Colors.brown, "lib/images/cheesse_burger.png"],
    ["Chicken Burger", "60", Colors.yellow, "lib/images/chicken_burger.png"],
    ["Bacon Burger", "80", Colors.red, "lib/images/bacon_burger.png"],
    ["Fries Burger", "45", Colors.green, "lib/images/fries_burger.png"],
    ["Black Burger", "90", Colors.purple, "lib/images/black_burger.png"],
    ["Triple Burger", "70", Colors.blue, "lib/images/triple_burger.png"],
    ["Fire Burger", "55", Colors.orange, "lib/images/fire_burger.png"],
    ["Burger", "85", Colors.grey, "lib/images/burger.png"],
  ];

  final Function(double) onAddToCart; // Callback para agregar al carrito

  BurgerTab(
      {super.key,
      required this.onAddToCart}); // Asegúrate de recibir el callback

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgersOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.65,
      ),
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: burgersOnSale[index][0],
          burgerPrice: burgersOnSale[index][1],
          burgerColor: burgersOnSale[index][2],
          imageName: burgersOnSale[index][3],
          onAddToCart: () => onAddToCart(
              double.parse(burgersOnSale[index][1])), // Llama al callback
        );
      },
    );
  }
}
