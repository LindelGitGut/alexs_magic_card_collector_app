import 'package:alexs_magic_card_collector_app/data/cardmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/autocomplete.dart';
import '../services/jsonservice.dart';

Future<Widget> searchBar({required Function themeCallBack, required Function updateCardResults, String hinttext = "Search All Cards", required Function allCardCallBack}) async {
  bool isdark = await getThemeFromSharedPrefs();

  return SearchAnchor(
      isFullScreen: false,

      builder: (BuildContext context, SearchController controller) {
    return SearchBar(
      hintText: hinttext,
      controller: controller,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0)),
      onTap: () {
       //
        //controller.openView();
      },
      onChanged: (value) async {
        //List<MagicCardModel> cardModels = await ReadJsonFile.getMagicCardModelViaName(name: value);
        //updateCardResults(cardModels);

      },

      onSubmitted: (value) async {
        List<MagicCardModel> cardModels = await ReadJsonFile.getMagicCardModelViaQuery(query: value);
        print("Debug on Submitted: $cardModels");
        updateCardResults(cardModels);
        allCardCallBack();
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
  }, suggestionsBuilder: (BuildContext context, SearchController controller) async {
    List<String> suggestions = await AutocompleteService.getAutocompleteSuggestions(
      path: 'lib/assets/card-bulk-example.json', // Pfad zur JSON-Datei
      attributeKeys: ['name','type_lines', /*'set' , 'set_name', 'collector_number'*/], // Der Schlüssel für die Autovervollständigung
      query: controller.text, // Die aktuelle Benutzereingabe
    );
    // Generieren der ListTile-Liste basierend auf den Vorschlägen
    return suggestions.map((String item) {
      return ListTile(
        title: Text(item),
        onTap: () async {
          List<MagicCardModel> cardModels = await ReadJsonFile.getMagicCardModelViaQuery(query: item);
          updateCardResults(cardModels);

          controller.closeView(item);
        },
      );
    }).toList();

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
