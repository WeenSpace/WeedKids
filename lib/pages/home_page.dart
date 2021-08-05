import 'package:flutter/material.dart';
import 'package:weedkids/pages/alphabet_page.dart';
import 'package:weedkids/pages/alphabet_vi_page.dart';
import 'package:weedkids/pages/numbers_page.dart';
import 'package:weedkids/pages/colors_page.dart';
import 'package:weedkids/pages/marks_page.dart';
import 'package:weedkids/pages/flags_page.dart';
import 'package:weedkids/pages/animals_page.dart';
import 'package:weedkids/pages/vehicles_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RestorationMixin {

  late TabController _tabController;

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
      length: 26,
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

    void _onMenuItemTapped(String menuName) {
      print("Click event on Container {index}" + menuName);
      switch (menuName) {
        case "NUMBERS":
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NumbersPage())
          );
          break;
        case "COLORS":
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ColorsPage())
          );
          break;
        case "MARKS":
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MarksPage())
          );
          break;
        case "FLAGS":
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FlagsPage())
          );
          break;
        case "ANIMALS":
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AnimalsPage())
          );
          break;
        case "ALPHABET_VI":
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlphabetViPage())
          );
          break;
        case "VEHICLES":
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VehiclesPage())
          );
          break;
        case "ALPHABET":
        default:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlphabetPage())
          );
        break;
      }

    }
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.count(
                      crossAxisCount: 2 ,
                      children: [
                        Container(
                          child: InkWell(
                            child: Card(
                              color: Colors.yellow,
                              child: Center(
                                child: Text(
                                  "Numbers",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              _onMenuItemTapped("NUMBERS");
                            },
                          ),
                        ),
                        Container(
                          child: InkWell(
                            child: Card(
                              color: Colors.red,
                              child: Center(
                                child: Text(
                                  "Alphabet",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              _onMenuItemTapped("ALPHABET");
                            },
                          ),
                        ),
                        Container(
                          child: InkWell(
                            child: Card(
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  "Marks",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              _onMenuItemTapped("MARKS");
                            },
                          ),
                        ),

                        Container(
                          child: InkWell(
                            child: Card(
                              color: Colors.blue,
                              child: Center(
                                child: Text(
                                  "Colors",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              _onMenuItemTapped("COLORS");
                            },
                          ),
                        ),

                        Container(
                          child: InkWell(
                            child: Card(
                              color: Colors.brown,
                              child: Center(
                                child: Text(
                                  "Animals",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              _onMenuItemTapped("ANIMALS");
                            },
                          ),
                        ),

                        Container(
                          child: InkWell(
                            child: Card(
                              color: Colors.indigo,
                              child: Center(
                                child: Text(
                                  "Flags",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              _onMenuItemTapped("FLAGS");
                            },
                          ),
                        ),

                        Container(
                          child: InkWell(
                            child: Card(
                              color: Colors.pink,
                              child: Center(
                                child: Text(
                                  "Chữ cái",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              _onMenuItemTapped("ALPHABET_VI");
                            },
                          ),
                        ),

                        Container(
                          child: InkWell(
                            child: Card(
                              color: Colors.purple,
                              child: Center(
                                child: Text(
                                  "Vehicles",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              _onMenuItemTapped("VEHICLES");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}


