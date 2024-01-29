import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Widget> searchBar({required Function themeCallBack}) async {
  bool isdark = await getThemeFromSharedPrefs();

  return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
    return SearchBar(
      controller: controller,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0)),
      onTap: () {
        controller.openView();
      },
      onChanged: (_) {
        controller.openView();
      },
      leading: const Icon(Icons.search),
      trailing: <Widget>[
        Tooltip(
          message: 'Change brightness mode',
          child: IconButton(
            isSelected: isdark,
            onPressed: () async {
              isdark = await getThemeFromSharedPrefs();
              themeCallBack(!isdark);
              saveThemeInSharedPrefs(!isdark);
            },
            icon: const Icon(Icons.wb_sunny_outlined),
            selectedIcon: const Icon(Icons.brightness_2_outlined),
          ),
        )
      ],
    );
  }, suggestionsBuilder: (BuildContext context, SearchController controller) {
    return List<ListTile>.generate(5, (int index) {
      final String item = 'item $index';
      return ListTile(
        title: Text(item),
        onTap: () {
          /*setState(() {
            controller.closeView(item);
          });*/
        },
      );
    });
  });
}

Future<void> saveThemeInSharedPrefs(bool isdark) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('darktheme', isdark);
  print("Darktheme in Shared prefs gesichert: " + isdark.toString());
}



Future<bool> getThemeFromSharedPrefs() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool value = prefs.getBool("darktheme") ?? false;
  if (value == null || value == false) {
    print("Theme aus sharedPrefs geladen, Darktheme: false");
    return false;
  } else {
    print("Theme aus sharedPrefs geladen, Darktheme: true");
    return true;
  }
}
