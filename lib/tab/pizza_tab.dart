import 'package:flutter/material.dart';
import 'package:p1_donut_app_leonardo_bocos/utils/pizza_tile.dart';

class PizzaTab extends StatelessWidget {
  final List pizzasOnSale = [
// [ pizzaFlavor, pizzaPrice, pizzaColor, imageName ]
    ["Margherita", "80", Colors.red, "lib/images/margarita_pizza.png"],
    ["Pepperoni", "95", Colors.brown, "lib/images/peperoni_pizza.png"],
    ["Cheese", "75", Colors.green, "lib/images/cheese_pizza.png"],
    ["Slide", "90", Colors.orange, "lib/images/individual_pizza.png"],
    ["Hawaiian", "85", Colors.yellow, "lib/images/piña_pizza.png"],
    ["Italian", "100", Colors.red, "lib/images/italian_pizza.png"],
    ["Mexican", "95", Colors.blue, "lib/images/mexican_pizza.png"],
    ["Tomato", "92", Colors.pink, "lib/images/tomate_pizza.png"],
  ];

  final Function(double) onAddToCart; // Callback para agregar al carrito

  PizzaTab(
      {super.key,
      required this.onAddToCart}); // Asegúrate de recibir el callback

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzasOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.65,
      ),
      itemBuilder: (context, index) {
        return PizzaTile(
          pizzaFlavor: pizzasOnSale[index][0],
          pizzaPrice: pizzasOnSale[index][1],
          pizzaColor: pizzasOnSale[index][2],
          imageName: pizzasOnSale[index][3],
          onAddToCart: () => onAddToCart(
              double.parse(pizzasOnSale[index][1])), // Llama al callback
        );
      },
    );
  }
}
