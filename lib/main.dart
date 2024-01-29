import 'package:flutter/material.dart';

import 'components/CardGridView.dart';
import 'components/left_menu_drawer.dart';
import 'components/searchbar_simple.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  bool isdark = false;

  @override
  State<MyApp> createState() => MyApp_State();
}

class MyApp_State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Alexs Magic Collector',
        theme: themeDark(isdark: widget.isdark),
        home: MyHomePage(
          title: 'Alexs Magic Collector',
          themeCallBack: switchThemeCallBack,
        ));
  }

  void switchThemeCallBack(bool isdark) {
    widget.isdark = isdark;
    setState(() {});
  }

  ThemeData themeDark({bool isdark = true}) {
    return ThemeData(
        useMaterial3: true,
        brightness: isdark ? Brightness.dark : Brightness.light);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.themeCallBack});

  final String title;
  final Function(bool) themeCallBack;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _showingcards = 0;
  final bool isDark = false;

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
              future: searchBar(themeCallBack: widget.themeCallBack),
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data! as Widget;
                } else {
                  return ErrorWidget(
                      Exception("Searchbar has thrown an Error"));
                }
              }),
          cardGridView(),
        ],
      ),
    );
  }
}
