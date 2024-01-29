import 'package:flutter/material.dart';

import 'cardtile.dart';

Widget cardGridView() {
  return Expanded(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Anzahl der Spalten
        ),
        itemCount: 2, //items.length,
        itemBuilder: (context, index) {
          return getMagicCardTile();
        }),
  );
}
