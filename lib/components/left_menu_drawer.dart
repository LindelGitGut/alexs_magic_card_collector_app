import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawerLeft(BuildContext context) {
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
            // Update the state of the app
            // Then close the drawer
            Navigator.pop(context);
          },
        ),

        ListTile(
          title: const Text('My Collected Cards'),
          //selected: _selectedIndex == 0,
          onTap: () {
            // Update the state of the app
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('My Card Wishlist'),
          //selected: _selectedIndex == 1,
          onTap: () {
            // Update the state of the app
            // _onItemTapped(1);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Filtered Search'),
          //selected: _selectedIndex == 2,
          onTap: () {
            // Update the state of the app
            // _onItemTapped(2);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
