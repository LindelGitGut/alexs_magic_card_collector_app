import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/CardGridView.dart';
import '../components/searchbar_simple.dart';
import '../data/cardmodel.dart';


class AllCards extends StatefulWidget {

 final Function themeCallBack;
 final Function updateCardResults;
 List<MagicCardModel> cardresults;

   AllCards({Key? key, required Function this.themeCallBack, required Function this.updateCardResults,
    required BuildContext context, required this.cardresults}) : super(key: key);



  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: searchBar(
                themeCallBack: widget.themeCallBack,
                updateCardResults: widget.updateCardResults),
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
        cardGridView(widget.cardresults, context),
      ],
    );
  }
}



