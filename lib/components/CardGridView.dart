import 'package:flutter/material.dart';

import '../data/cardmodel.dart';
import 'cardtile.dart';

//TODO List or Array of found Card Elements passed through

Widget cardGridView(List<MagicCardModel> cards, BuildContext context) {
  return Expanded(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Anzahl der Spalten
        ),
        itemCount: cards.length, //items.length,
        itemBuilder: (context, index) {
          return getMagicCardTile(cards[index], context);
        }),
  );
}
