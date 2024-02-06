import 'package:alexs_magic_card_collector_app/views/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/cardmodel.dart';

Widget drawerLeft({
  required BuildContext context,
  required Function themeCallBack,
  required Function updateCardResults,
  required Function setPageStateCallBack,
  required List<MagicCardModel> cardresults}) {

  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
          ),
          child: Text('Navigation'),
        ),

        ListTile(
          title: const Text('All Cards'),
          //selected: _selectedIndex == 0,
          onTap: () {
            setPageStateCallBack(page : "All Cards");
            Navigator.pop(context);

          },
        ),

        ListTile(
          title: const Text('My Collected Cards'),
          //selected: _selectedIndex == 0,
          onTap: () {
            setPageStateCallBack(page : "My Collected Cards");
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('My Card Wishlist'),
          //selected: _selectedIndex == 1,
          onTap: () {
            setPageStateCallBack(page : "My Card Wishlist");
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Filtered Search'),
          //selected: _selectedIndex == 2,
          onTap: () {
            setPageStateCallBack(page : "Filtered Search");
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
