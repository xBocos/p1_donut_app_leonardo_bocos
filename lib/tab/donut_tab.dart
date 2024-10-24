import 'package:flutter/material.dart';
import 'package:p1_donut_app_leonardo_bocos/utils/donut_tile.dart';

class DonutTab extends StatelessWidget {
  final List donutsOnSale = [
// [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Pistachio", "26", Colors.yellow, "lib/images/pistacho_donut.png"],
    ["Mint", "35", Colors.orange, "lib/images/menta_donut.png"],
    ["Four", "10", Colors.pink, "lib/images/4donas.png"],
    ["Six", "72", Colors.green, "lib/images/docena_donas.png"],
  ];

  final Function(double) onAddToCart; // Callback para agregar al carrito

  DonutTab(
      {super.key,
      required this.onAddToCart}); // Asegúrate de recibir el callback

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.65,
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
          onAddToCart: () => onAddToCart(
              double.parse(donutsOnSale[index][1])), // Llama al callback
        );
      },
    );
  }
}
