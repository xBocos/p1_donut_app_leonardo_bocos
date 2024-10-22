import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String label; // Añadimos una nueva propiedad para el texto

  const MyTab({
    super.key,
    required this.iconPath,
    required this.label, // El texto se pasa como argumento
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300], // Fondo gris claro como en la imagen
              borderRadius: BorderRadius.circular(12), // Borde redondeado
            ),
            child: Image.asset(
              iconPath,
              color: Colors.grey[600], // Color gris oscuro del icono
              height: 20, // Ajuste de tamaño del icono
            ),
          ),
          const SizedBox(height: 0), // Espacio entre el icono y el texto
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600], // Mismo color que los iconos
              fontSize: 7.3, // Tamaño de fuente pequeño como en la imagen
              fontWeight: FontWeight.w500, // Negrita para resaltar el texto
            ),
          ),
        ],
      ),
    );
  }
}
