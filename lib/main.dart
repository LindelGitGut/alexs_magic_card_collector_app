import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/CardGridView.dart';
import 'components/left_menu_drawer.dart';
import 'components/searchbar_simple.dart';
import 'data/cardmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyApp_State();
}

class MyApp_State extends State<MyApp> {
  @override
  void initState() {
    getThemeFromSharedPrefs();
    super.initState();
  }

  bool? isdark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Alexs Magic Collector',
        theme: themeDark(isdark: isdark!),
        home: MyHomePage(
          title: 'Alexs Magic Collector',
          themeCallBack: switchThemeCallBack,
        ));
  }

  void switchThemeCallBack(bool isdark) {
    this.isdark = isdark;
    setState(() {});
  }

  ThemeData themeDark({required bool isdark}) {
    return ThemeData(
        useMaterial3: true,
        brightness: isdark ? Brightness.dark : Brightness.light);
  }

  void getThemeFromSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool("darktheme") ?? false;
    if (value == null || value == false) {
      print("Homepage Darktheme: false");
      isdark = false;
      switchThemeCallBack(false);
    } else {
      isdark = true;
      print("Homepage Darktheme: true");
      switchThemeCallBack(true);
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.themeCallBack});

  final String title;
  final Function(bool) themeCallBack;
  List<MagicCardModel> cardresults = [];




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _showingcards = 0;
  final bool isDark = false;

  void updateCardResults (MagicCardModel cardModel) {
    widget.cardresults.add(cardModel);
    print("updateCardresults aufgerufen! : " +widget.cardresults.toString());

  setState(() {

  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        foregroundColor: Colors.deepOrange,
      ),
      drawer: drawerLeft(context),
      body: Column(
        children: [
          FutureBuilder(
              future: searchBar(themeCallBack: widget.themeCallBack, updateCardResults: updateCardResults),
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data as Widget;
                } else {
                  return ErrorWidget(
                      Exception("Searchbar has thrown an Error"));
                }
              }),
          SizedBox(height: 20.0,),
          cardGridView(widget.cardresults, context),

        ],
      ),
    );
  }
}
