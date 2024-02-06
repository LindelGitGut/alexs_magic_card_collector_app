import 'package:flutter/cupertino.dart';

import '../components/CardGridView.dart';
import '../components/searchbar_simple.dart';
import '../data/cardmodel.dart';

Widget wishlList(
    {required Function themeCallBack,
    required Function updateCardResults,
    required BuildContext context,
    required List<MagicCardModel> cardresults}) {
  return Column(
    children: [
      FutureBuilder(
          future: searchBar(
              hinttext: "Search in Wishlist" ,
              themeCallBack: themeCallBack,
              updateCardResults: updateCardResults),
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data as Widget;
            } else {
              return ErrorWidget(Exception("Searchbar has thrown an Error"));
            }
          }),
      SizedBox(
        height: 20.0,
      ),
      cardGridView(cardresults, context),
    ],
  );
}
