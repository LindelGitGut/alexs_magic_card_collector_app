import 'package:flutter/material.dart';

import 'components/CardGridView.dart';
import 'components/left_menu_drawer.dart';
import 'components/searchbar_simple.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alexs Magic Collector',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Alexs Magic Collector'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _showingcards = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: drawerLeft(context),
      body: Column(
        children: [
          searchBar(),
          cardGridView(),
        ],
      ),
    );
  }
}
