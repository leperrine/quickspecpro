import 'package:flutter/material.dart';

import 'package:quickspecpro/app/contactPages/contacts_page.dart';
import 'package:quickspecpro/app/inspectionPages/inspections_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_templates_page.dart';
import 'package:quickspecpro/constants/keys.dart';
import 'package:quickspecpro/shared/logo.dart';
import 'package:quickspecpro/shared/navigation/core_drawer.dart';

class CoreScaffold extends StatefulWidget {
  CoreScaffold({Key key}) : super(key: key);
  

  @override
  _CoreScaffoldState createState() => _CoreScaffoldState();
}

class _CoreScaffoldState extends State<CoreScaffold> {
  List<Widget> pages = <Widget>[
    ContactsPage(),
    UserTemplatesPage(),
    InspectionsPage(),
  ];
  int selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(Keys.tabBar),
      appBar: AppBar(
        elevation: 5,
        actions: <Widget>[
          Logo(),
        ],
      ),
      drawer: CoreDrawer(),
      bottomNavigationBar: buildBottomAppBar(context),
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      backgroundColor: Colors.grey[50],
      // bottomNavigationBar: AppTabBar,
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: BottomNavigationBar(
        fixedColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black87,
        unselectedIconTheme: IconThemeData(color: Colors.black87),
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedIndex,
        key: Key(Keys.tabBar),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Contacts')),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('Templates')),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), title: Text('Inspections')),
        ],
        onTap: _onTabTapped,
      ),
    );
  }
}
