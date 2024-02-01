import 'package:alexs_magic_card_collector_app/data/cardmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/jsonservice.dart';
import '../views/detailedcardview.dart';

Card getMagicCardTile(MagicCardModel cardModel, BuildContext context) {
  return Card(
      child: GestureDetector(
    onTap: () {
      print("Tap Detected!");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  DetailedCardView(cardModel: cardModel)),
      );


      //Debugging , TODO remove



      
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.network(
            cardModel.illustrationUrl!,
            fit: BoxFit.cover,
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(cardModel.name!),
        ),
      ],
    ),
  ));
}
