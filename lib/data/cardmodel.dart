import 'dart:convert';

import 'package:equatable/equatable.dart';


class MagicCardModel extends Equatable {


  late String? name;
  late String? cardType;
  late String? manaCost;
  late List<String?> colorIdentity;
  late String? illustrationUrl; // URL zur Kartenillustration
  late int? power; // Für Kreaturen
  late int? toughness; // Für Kreaturen
  late String? typeSpecificInfo;
  late String? textBox;
  late String? rarity;
  late String? setSymbol;
  late String? collectorNumber;
  late String? editionName;
  late String? legalStatus;



  //Constructor, named parameter deswegen Klassenname({namedvalue1, namedvalue2, ....})
  MagicCardModel({
    required this.name,
    required this.cardType,
    required this.manaCost,
    required this.colorIdentity,
    required this.illustrationUrl,
    required this.power,
    required this.toughness,
    required this.typeSpecificInfo,
    required this.textBox,
    required this.rarity,
    required this.setSymbol,
    required this.collectorNumber,
    required this.editionName,
    required this.legalStatus,
});


// Methoden um JSON zu werte zu interpretieren

  //generiert ein neues Model aus erhaltenen json File,

  factory MagicCardModel.fromJson(Map<String, dynamic> json) {
    return MagicCardModel(
      name: json['name'] as String?,
      cardType: json['type_line'] as String?,
      manaCost: json['mana_cost'] as String?,
      colorIdentity: List<String?>.from(json['color_identity'].map((e) => e as String?)),
      illustrationUrl: json['image_uris'] != null ? json['image_uris']['normal'] : null,
      power: json['power'] != null ? int.tryParse(json['power']) : null,
      toughness: json['toughness'] != null ? int.tryParse(json['toughness']) : null,
      typeSpecificInfo: json['oracle_text'] as String?,
      textBox: json['oracle_text'] as String?,
      rarity: json['rarity'] as String?,
      setSymbol: json['set'] as String?,
      collectorNumber: json['collector_number'] as String?,
      editionName: json['set_name'] as String?,
      legalStatus: json['legalities'] != null ? jsonEncode(json['legalities']) : null,
    );
  }

  // Template für to json, wird aktuell noch nicht benötigt
/*
  Map<String, dynamic> toJson() {
    return {
      "current_firmware_version": current_firmware_version.toString(),
    };
  }
*/

  // Dies ist eine Hilfmethode um einezelne Values eines States ändern zu können und values aus dem alten State
  // (und somit auch die values des alten Models) zu übernehmen
  // als Parameter werden alle zu setzendden Variablen des Models eingesetzt

  MagicCardModel copyWith({

    String? name,
    String? cardType,
    String? manaCost,
    required List<String?> colorIdentity,
    String? illustrationUrl, // URL zur Kartenillustration
    int? power, // Für Kreaturen
    int? toughness, // Für Kreaturen
    String? typeSpecificInfo,
    String? textBox,
    String? rarity,
    String? setSymbol,
    String? collectorNumber,
    String? editionName,
    String? legalStatus,
})
  // nun wird der Konstruktor des UpdateModels aufgerufen, mit ?? wird überprüft ob der jeweilige
  // Parameter Null ist, wenn dies zutrift, wird der Value aus dem vorherigen State verwendet
  // Da wir named Parameter benutzen müssen wir die parameter mit parametername : value übergeben
  {
    return MagicCardModel(
        name : name ?? this.name,
        cardType :  cardType ?? this.cardType,
        manaCost : manaCost ?? this.manaCost,
        colorIdentity : colorIdentity ?? this.colorIdentity,
        illustrationUrl : illustrationUrl ?? this.illustrationUrl, // URL zur Kartenillustration
        power : power ?? this.power, // Für Kreaturen
        toughness : toughness ?? this.toughness, // Für Kreaturen
        typeSpecificInfo : typeSpecificInfo ?? this.typeSpecificInfo,
        textBox : textBox ?? this.textBox,
        rarity : rarity ?? this.rarity,
        setSymbol : setSymbol ?? this.setSymbol,
        collectorNumber : collectorNumber ?? this.collectorNumber,
        editionName : editionName ?? this.editionName,
        legalStatus : legalStatus ?? this.legalStatus,
    );
  }

  // hier muss jede Variable mit ins Array aufgenommen werden welche mit dem == Operator wertemäßig
  // verglichen werden soll
  @override
  List<Object?> get props =>
      [
        name,
        cardType,
        manaCost,
        colorIdentity,
        illustrationUrl,
        power,
        toughness,
        typeSpecificInfo,
        textBox,
        rarity,
        setSymbol,
        collectorNumber,
        editionName,
        legalStatus,
      ];

  // OVerride der toString Methode um aktuelle Values als String anzeigen zu lassen, praktisch für Debugging
  // und andere Vergleiche
  @override
  String toString() {
    return 'MagicCardModel {\n'
        '  Name: $name,\n'
        '  Card Type: $cardType,\n'
        '  Mana Cost: $manaCost,\n'
        '  Color Identity: ${colorIdentity.join(', ')},\n'
        '  Illustration URL: $illustrationUrl,\n'
        '  Power: $power,\n'
        '  Toughness: $toughness,\n'
        '  Type Specific Info: $typeSpecificInfo,\n'
        '  Text Box: $textBox,\n'
        '  Rarity: $rarity,\n'
        '  Set Symbol: $setSymbol,\n'
        '  Collector Number: $collectorNumber,\n'
        '  Edition Name: $editionName,\n'
        '  Legal Status: $legalStatus\n'
        '}';
  }

}



