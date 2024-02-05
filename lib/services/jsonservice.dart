import 'dart:convert';

import 'package:alexs_magic_card_collector_app/data/cardmodel.dart';
import 'package:flutter/services.dart' as root_bundle;

import 'dart:convert';
import 'package:flutter/services.dart' as root_bundle;

class ReadJsonFile {
  static Future<List<Map>> readJsonData({required String path}) async {
    // read json file
    final jsondata = await root_bundle.rootBundle.loadString(path);

    // decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;

    // map each item in list to a Map
    final mappedList = list.map((item) => item as Map).toList();

    // TODO remove print "Debugging"
    print("Json File wurde gelesen : " + mappedList.toString());

    return mappedList;
  }

  static Future<String> getImgUrl({required String set,
    required String collectornumber,
    String path = "lib/assets/card-bulk-example.json",
    String imagesize = "normal"}) async {
    String imgurl;
    final List<Map<dynamic, dynamic>> mappedList =
    await readJsonData(path: path);
    var result = mappedList.firstWhere(
          (object) =>
      object.values.contains(set) &&
          object.values.contains(collectornumber),
    );
    Map<dynamic, dynamic> imguris = result['image_uris'];
    imgurl = imguris[imagesize];
    //Debugging TODO Remove print
    print("Debugging get imgUrl : " + imgurl.toString());
    return imgurl;
  }


  static Future<MagicCardModel> getMagicCardModelViaName({required String name,
    String path = "lib/assets/card-bulk-example.json",
  }) async {
    final List<Map<dynamic, dynamic>> mappedList =
    await readJsonData(path: path);
    var result = mappedList.firstWhere(
          (object) =>
      object.values.contains(name)
    );

    String cardtype = result['type_line'].toString().split("-")[0];

    return MagicCardModel(
      name: result['name'],
      cardType: cardtype,
      manaCost: result['mana_cost'],
      colorIdentity: List<String?>.from(result['color_identity'].map((e) => e as String?)),
      illustrationUrl: await getImgUrl(set: result['set'], collectornumber: result['collector_number']),
      power: int.parse(result['power']),
      toughness: int.parse(result['toughness']),
      typeSpecificInfo: result['oracle_text'] ?? "",
      textBox: result['oracle_text'],
      rarity: result['rarity'],
      //TODO check if Symbol of set can be obtrained
      setSymbol: "",
      collectorNumber:result['collector_number'],
      editionName: result['set_name'],
      legalStatus: result['legalities'] != null ? jsonEncode(result['legalities']) : null,);
  }

  static Future<MagicCardModel> getMagicCardModel({required String set,
    required String collectornumber,
    String path = "lib/assets/card-bulk-example.json",
  }) async {
    final List<Map<dynamic, dynamic>> mappedList =
        await readJsonData(path: path);
    var result = mappedList.firstWhere(
          (object) =>
      object.values.contains(set) &&
          object.values.contains(collectornumber),
    );
      
    String cardtype = result['type_line'].toString().substring(0,result['type_line'].toString().indexOf(' - '));

    return MagicCardModel(
        name: result['name'],
        cardType: cardtype,
        manaCost: result['mana_cost'],
        colorIdentity: result['color_identity'],
        illustrationUrl: await getImgUrl(set: set, collectornumber: collectornumber),
        power: result['power'],
        toughness: result['toughness'] ?? "",
        typeSpecificInfo: result['oracle_text'] ?? "",
        textBox: result['oracle_text'],
        rarity: result['rarity'],
        //TODO check if Symbol of set can be obtrained
        setSymbol: "",
        collectorNumber:result['collector_number'],
        editionName: result['set_name'],
        legalStatus: result['legalities'] != null ? jsonEncode(result['legalities']) : null,);
  }
}
