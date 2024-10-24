import 'package:flutter/material.dart';

import '../utils/my_tab.dart';

import '../tab/burger_tab.dart';
import '../tab/pizza_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/smoothie_tab.dart';
import '../tab/pancake_tab.dart';

// 1. Modelo de carrito
class Cart {
  int itemCount;
  double totalAmount;

  Cart({this.itemCount = 0, this.totalAmount = 0.0});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista de tabs
  List<Widget> myTabs = [
    // Donut tab
    const MyTab(
      iconPath: "lib/icons/donut.png",
      label: "Donut",
    ),
    // Burger tab
    const MyTab(
      iconPath: "lib/icons/burger.png",
      label: "Burger",
    ),
    // Smoothie tab
    const MyTab(
      iconPath: "lib/icons/smoothie.png",
      label: "Smoothie",
    ),
    // Pancakes tab
    const MyTab(
      iconPath: "lib/icons/pancakes.png",
      label: "Pancakes",
    ),
    // Pizza tab
    const MyTab(
      iconPath: "lib/icons/pizza.png",
      label: "Pizza",
    ),
  ];

  Cart cart = Cart(); // Instancia del carrito

  void addToCart(double price) {
    setState(() {
      cart.itemCount += 1;
      cart.totalAmount += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
          children: [
            // Texto "I want to eat"
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text(
                    "I Want to ",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Eat",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            // Tab bar
            TabBar(tabs: myTabs),
            // Tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(onAddToCart: addToCart), // Pasamos la función
                  BurgerTab(onAddToCart: addToCart),
                  SmoothieTab(onAddToCart: addToCart),
                  PancakeTab(onAddToCart: addToCart),
                  PizzaTab(onAddToCart: addToCart),
                ],
              ),
            ),
            // Total del carrito
            CartSummary(
                itemCount: cart.itemCount,
                totalAmount: cart.totalAmount), // Actualizamos el CartSummary
          ],
        ),
      ),
    );
  }
}

// 2. Widget CartSummary
class CartSummary extends StatelessWidget {
  final int itemCount;
  final double totalAmount;

  const CartSummary(
      {super.key, required this.itemCount, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Texto con cantidad de ítems y precio total
              Text(
                "$itemCount Items | \$$totalAmount",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Botón "View Cart"
              ElevatedButton(
                onPressed: () {
                  // Acción del botón
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, // Color del botón
                ),
                child: const Text("View Cart"),
              ),
            ],
          ),
          const SizedBox(
              height:
                  8), // Espacio entre el texto principal y el texto de entrega
          // Texto de "Delivery Charges Included"
          const Text(
            "Delivery Charges Included",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
