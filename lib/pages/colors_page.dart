import 'dart:math';
import 'package:flutter/material.dart';

class ColorsPage extends StatefulWidget {
  @override
  _ColorsPageState createState() => _ColorsPageState();
}

class Palette {
  Palette({ this.name = 'RED', this.primary = Colors.red, this.accent = Colors.redAccent, this.threshold = 300});
  final String name;
  final MaterialColor primary;
  final MaterialAccentColor accent;
  final int threshold; // titles for indices > threshold are white, otherwise black
  // bool get isValid => name != null && primary != null && threshold != null;
}

class _ColorsPageState extends State<ColorsPage>
    with SingleTickerProviderStateMixin, RestorationMixin {

  late TabController _tabController;

  final List<Palette> tabs = <Palette>[
    Palette(name: 'RED', primary: Colors.red, accent: Colors.redAccent, threshold: 300),
    Palette(name: 'ORANGE', primary: Colors.orange, accent: Colors.orangeAccent, threshold: 700),
    // Palette(name: 'DEEP ORANGE', primary: Colors.deepOrange, accent: Colors.deepOrangeAccent, threshold: 400),
    Palette(name: 'YELLOW', primary: Colors.yellow, accent: Colors.yellowAccent),
    Palette(name: 'GREEN', primary: Colors.green, accent: Colors.greenAccent, threshold: 500),
    Palette(name: 'PINK', primary: Colors.pink, accent: Colors.pinkAccent, threshold: 200),
    Palette(name: 'PURPLE', primary: Colors.purple, accent: Colors.purpleAccent, threshold: 200),
    // Palette(name: 'DEEP PURPLE', primary: Colors.deepPurple, accent: Colors.deepPurpleAccent, threshold: 200),
    Palette(name: 'INDIGO', primary: Colors.indigo, accent: Colors.indigoAccent, threshold: 200),
    Palette(name: 'BLUE', primary: Colors.blue, accent: Colors.blueAccent, threshold: 400),
    // Palette(name: 'LIGHT BLUE', primary: Colors.lightBlue, accent: Colors.lightBlueAccent, threshold: 500),
    // Palette(name: 'CYAN', primary: Colors.cyan, accent: Colors.cyanAccent, threshold: 600),
    // Palette(name: 'TEAL', primary: Colors.teal, accent: Colors.tealAccent, threshold: 400),

    // Palette(name: 'LIGHT GREEN', primary: Colors.lightGreen, accent: Colors.lightGreenAccent, threshold: 600),
    // Palette(name: 'LIME', primary: Colors.lime, accent: Colors.limeAccent, threshold: 800),

    // Palette(name: 'AMBER', primary: Colors.amber, accent: Colors.amberAccent),
    Palette(name: 'WHITE', primary: const MaterialColor(
      0xFFFFFFFF,
      const <int, Color>{
        50: const Color(0xFFFFFFFF),
        100: const Color(0xFFFFFFFF),
        200: const Color(0xFFFFFFFF),
        300: const Color(0xFFFFFFFF),
        400: const Color(0xFFFFFFFF),
        500: const Color(0xFFFFFFFF),
        600: const Color(0xFFFFFFFF),
        700: const Color(0xFFFFFFFF),
        800: const Color(0xFFFFFFFF),
        900: const Color(0xFFFFFFFF),
      },
    ), threshold: 200),
    Palette(name: 'BLACK', primary: const MaterialColor(
      0xFF000000,
      const <int, Color>{
        50: const Color(0xFF0000000),
        100: const Color(0xFF000000),
        200: const Color(0xFF000000),
        300: const Color(0xFF000000),
        400: const Color(0xFF000000),
        500: const Color(0xFF000000),
        600: const Color(0xFF000000),
        700: const Color(0xFF000000),
        800: const Color(0xFF000000),
        900: const Color(0xFF000000),
      },
    )),
    Palette(name: 'BROWN', primary: Colors.brown, threshold: 200),
    Palette(name: 'GREY', primary: Colors.grey, threshold: 500),

    // Palette(name: 'BLUE GREY', primary: Colors.blueGrey, threshold: 500),
  ];

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_scrollable';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: tabs.length,
      vsync: this,
    );
    _tabController.addListener(() {
      // When the tab controller's value is updated, make sure to update the
      // tab index value, which is state restorable.
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: "Back to Home",
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Colors"),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final tab in tabs)
            Container(
              margin: const EdgeInsets.all(50),
              child: InkWell(
                child: Card(
                  color: tab.primary,
                  child: Center(
                    child: Text(
                      tab.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            for (final Palette tab in tabs) Tab(text: tab.name),
          ],
        ),
      ),
    );
  }
}


