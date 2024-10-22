import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor; //dynamic porque sera de tipo color
  final String imageName;

  const DonutTile(
      {super.key,
      required this.donutFlavor,
      required this.donutPrice,
      this.donutColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          decoration: BoxDecoration(
              color: donutColor[50], borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: donutColor[100],
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24))),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    child: Text('\$$donutPrice',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: donutColor[800])),
                  )
                ],
              ),
              //Donut picture
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Image.asset(imageName),
              ),
              //Donut flavor text
              Text(
                donutFlavor,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              Text(
                'Dunkin`s',
                style: TextStyle(color: Colors.grey[600]),
              ),
              //love icon + add button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Love icon
                    Icon(Icons.favorite, color: Colors.pink[400]),
                    //Plus button
                    Icon(Icons.add, color: Colors.grey[800])
                  ],
                ),
              )
            ],
          )),
    );
  }
}
