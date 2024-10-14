import 'package:flutter/material.dart';
import 'package:p1_donut_app_leonardo_bocos/utils/my_tab.dart';

import '../tab/burger_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/pizza_tab.dart';
import '../tab/smoothie_tab.dart';
import '../tab/pancake_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //donut Tab
    const MyTab(
      iconPath: 'lib/icons/donut.png',
    ),
    //burger Tab
    const MyTab(
      iconPath: 'lib/icons/burger.png',
    ),
    //Smoothie Tab
    const MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),
    //Pancake Tab
    const MyTab(
      iconPath: 'lib/icons/pancakes.png',
    ),
    //Pizza Tab
    const MyTab(
      iconPath: 'lib/icons/pizza.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
          children: [
            //Texto "I want to eat"
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text("I Want to ", style: TextStyle(fontSize: 24)),
                  Text(
                    "Eat",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
            //Tab bar
            TabBar(tabs: myTabs),
            //Tab bar view
            const Expanded(
                child: TabBarView(children: [
              DonutTab(),
              BurgerTab(),
              SmoothieTab(),
              PanCakeTab(),
              PizzaTab(),
            ])
                //Total del carrito
                )
          ],
        ),
      ),
    );
  }
}
