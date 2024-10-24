import 'package:flutter/material.dart';
import 'package:p1_donut_app_leonardo_bocos/utils/pancake_tile.dart';

class PancakeTab extends StatelessWidget {
  final List pancakesOnSale = [
// [ pancakeFlavor, pancakePrice, pancakeColor, imageName ]
    ["Coconut", "50", Colors.brown, "lib/images/coco.png"],
    ["Grape", "65", Colors.blue, "lib/images/uva.png"],
    ["Vanilla", "70", Colors.brown, "lib/images/vainilla.png"],
    ["Red Velvet", "55", Colors.red, "lib/images/redvelvet.png"],
    ["Orange", "60", Colors.yellow, "lib/images/naranja.png"],
    ["Mint", "75", Colors.orange, "lib/images/menta.png"],
    ["Mango", "68", Colors.grey, "lib/images/mango.png"],
    ["Strawberry", "90", Colors.purple, "lib/images/fresa.png"],
  ];

  final Function(double) onAddToCart; // Callback para agregar al carrito

  PancakeTab(
      {super.key,
      required this.onAddToCart}); // Asegúrate de recibir el callback

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pancakesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.65,
      ),
      itemBuilder: (context, index) {
        return PancakeTile(
          pancakeFlavor: pancakesOnSale[index][0],
          pancakePrice: pancakesOnSale[index][1],
          pancakeColor: pancakesOnSale[index][2],
          imageName: pancakesOnSale[index][3],
          onAddToCart: () => onAddToCart(
              double.parse(pancakesOnSale[index][1])), // Llama al callback
        );
      },
    );
  }
}
