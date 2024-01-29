import 'package:flutter/material.dart';

Widget cardGridView() {
  return Expanded(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Anzahl der Spalten
        ),
        itemCount: 1, //items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text("Testtext"),
            ),
          );
        }),
  );
}
