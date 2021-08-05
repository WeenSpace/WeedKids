import 'dart:math';
import 'package:flutter/material.dart';

import 'package:country_icons/country_icons.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlagsPage extends StatefulWidget {
  @override
  _FlagsPageState createState() => _FlagsPageState();
}

class MyFlag {
  MyFlag({ this.name = "", this.path = "" });
  final String name;
  final String path;
}

class _FlagsPageState extends State<FlagsPage>
    with SingleTickerProviderStateMixin, RestorationMixin {

  late TabController _tabController;
  final List<MyFlag> tabs = <MyFlag>[
    MyFlag(name: "CANADA", path: 'icons/flags/svg/ca.svg'),
    MyFlag(name: "SWITZERLAND", path: 'icons/flags/svg/ch.svg'),
    MyFlag(name: "FRANCE", path: 'icons/flags/svg/fr.svg'),
    MyFlag(name: "SPAIN", path: 'icons/flags/svg/es.svg'),
    MyFlag(name: "PORTUGAL", path: 'icons/flags/svg/pt.svg'),
    MyFlag(name: "USA", path: 'icons/flags/svg/us.svg'),
    MyFlag(name: "DENMARK", path: 'icons/flags/svg/dk.svg'),
    MyFlag(name: "FINLAND", path: 'icons/flags/svg/fi.svg'),
    MyFlag(name: "GERMANY", path: 'icons/flags/svg/de.svg'),
    MyFlag(name: "AUSTRALIA", path: 'icons/flags/svg/au.svg'),
    MyFlag(name: "UNITED KINGDOM", path: 'icons/flags/svg/gb.svg'),
    MyFlag(name: "NEW ZEALAND", path: 'icons/flags/svg/nz.svg'),
    MyFlag(name: "ITALY", path: 'icons/flags/svg/it.svg'),
    MyFlag(name: "NEW ZEALAND", path: 'icons/flags/svg/nz.svg'),
    MyFlag(name: "ITALY", path: 'icons/flags/svg/it.svg'),
    MyFlag(name: "BELGIUM", path: 'icons/flags/svg/be.svg'),
    MyFlag(name: "NETHERLANDS", path: 'icons/flags/svg/nl.svg'),
    MyFlag(name: "GEORGIA", path: 'icons/flags/svg/ge.svg'),
    MyFlag(name: "POLAND", path: 'icons/flags/svg/pl.svg'),
    MyFlag(name: "VIETNAM", path: 'icons/flags/svg/vn.svg'),
    MyFlag(name: "KOREA", path: 'icons/flags/svg/kr.svg'),
    MyFlag(name: "JAPAN", path: 'icons/flags/svg/jp.svg'),
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
        title: Text("Flags"),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final tab in tabs)
            Container(
              child: InkWell(
                child: Card(
                  child: SvgPicture.asset(tab.path, package: 'country_icons'),

                ),

              ),
            ),
        ],
      ),// This trailing
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            for (final tab in tabs) Tab(text: tab.name),
          ],
        ),
      ),
    );
  }
}


