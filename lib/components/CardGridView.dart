import 'package:flutter/material.dart';

import 'cardtile.dart';

//TODO List or Array of found Card Elements passed through

Widget cardGridView() {
  return Expanded(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Anzahl der Spalten
        ),
        itemCount: 2, //items.length,
        itemBuilder: (context, index) {
          return getMagicCardTile("Test", "https://cards.scryfall.io/small/front/0/0/000366c8-7a43-49d7-a103-ac5bd7efd9aa.jpg?1562052318");
        }),
  );
}
