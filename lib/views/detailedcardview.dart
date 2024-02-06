import 'package:alexs_magic_card_collector_app/data/cardmodel.dart';
import 'package:flutter/material.dart';

import '../components/left_menu_drawer.dart';
import '../services/collectionservice.dart';

class DetailedCardView extends StatefulWidget {
  const DetailedCardView({
    Key? key,
    required this.cardModel,
  }) : super(key: key);

  final MagicCardModel cardModel;

  @override
  State<DetailedCardView> createState() => _DetailedCardViewState();
}

class _DetailedCardViewState extends State<DetailedCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cardModel.name!),
        centerTitle: true,
        foregroundColor: Colors.deepOrange,
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.brown,
                  child: Image.network(widget.cardModel
                      .illustrationUrl!), //Center(child: Text("Big Card Image Placeholder")),
                )),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  //color: Colors.green,
                  width: MediaQuery.of(context).size.width - 20,
                  //color: Colors.green,
                  child: Column(
                    children: [
                      Text(widget.cardModel.name!),
                      Text(widget.cardModel.cardType!),
                      Text("Manacost: " + widget.cardModel.manaCost!),
                      Text("Power/Toughness : " +
                          widget.cardModel.power!.toString() +
                          "/" +
                          widget.cardModel.toughness.toString()!),
                      Spacer(
                        flex: 1,
                      ),
                      Text("Effect:"),
                      Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Text(widget.cardModel.textBox!),
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Row(
                        children: [
                          Text(widget.cardModel.rarity!),
                          Text(widget.cardModel.set!),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "add",
              tooltip: "Add Card to Collected"),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove),
              label: "remove",
              tooltip: "Remove Card from Collected"),
        ],
        onTap: (index) {
          if (index == 0) {
            print("add pressed!");
            Collectionservice.addCardToCollected(
                set: widget.cardModel.set!,
                collector_number: widget.cardModel.collectorNumber!);
          } else if (index == 1) {
            print("remove pressed!");
            Collectionservice.removeCardFromCollected(
                set: widget.cardModel.set!,
                collector_number: widget.cardModel.collectorNumber!);
          }
        },
      ),
    );
  }
}
