import 'jsonservice.dart';

class AutocompleteService {
  static Future<List<String>> getAutocompleteSuggestions({
    required String path,
    required List<String> attributeKeys,
    required String query,
  }) async {
    List<Map> jsonData = await ReadJsonFile.readJsonData(path: path);
    List<String> suggestions = [];

    for (var item in jsonData) {
      for (var key in attributeKeys) {
        if (item.containsKey(key) && item[key] is String) {
          String value = item[key].toLowerCase();
          if (value.contains(query.toLowerCase())) {
            suggestions.add(item[key]);

          }
        }
      }
    }

    return suggestions.toSet().toList(); // Konvertieren zu Set und zurück zu List, um Duplikate zu entfernen
  }
}
