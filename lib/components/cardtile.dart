import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Card getMagicCardTile() {
  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Expanded(child:    Image.network(
        'https://cards.scryfall.io/small/front/0/0/000366c8-7a43-49d7-a103-ac5bd7efd9aa.jpg?1562052318',
        fit: BoxFit.cover,
      ),),
        Text("MagicCardName"),
      ],
    ),
  );
}