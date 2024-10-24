import 'package:flutter/material.dart';
import 'package:p1_donut_app_leonardo_bocos/utils/smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
  final List smoothiesOnSale = [
// [ smoothieFlavor, smoothiePrice, smoothieColor, imageName ]
    ["Naranja", "50", Colors.red, "lib/images/orange_smoothie.png"],
    ["Mango", "55", Colors.orange, "lib/images/mango_smoothie.png"],
    ["Avocado", "60", Colors.purple, "lib/images/aguacate_smoothie.png"],
    ["Green", "65", Colors.green, "lib/images/green_smoothie.png"],
    ["Banana", "70", Colors.yellow, "lib/images/platano_smoothie.png"],
    ["Pineapple", "75", Colors.brown, "lib/images/piña_smoothie.png"],
    ["Strawberry", "65", Colors.cyan, "lib/images/fresa_smoothie.png"],
    ["Grape", "55", Colors.pink, "lib/images/uva_smoothie.png"],
  ];

  final Function(double) onAddToCart; // Callback para agregar al carrito

  SmoothieTab(
      {super.key,
      required this.onAddToCart}); // Asegúrate de recibir el callback

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothiesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.65,
      ),
      itemBuilder: (context, index) {
        return SmoothieTile(
          smoothieFlavor: smoothiesOnSale[index][0],
          smoothiePrice: smoothiesOnSale[index][1],
          smoothieColor: smoothiesOnSale[index][2],
          imageName: smoothiesOnSale[index][3],
          onAddToCart: () => onAddToCart(
              double.parse(smoothiesOnSale[index][1])), // Llama al callback
        );
      },
    );
  }
}
