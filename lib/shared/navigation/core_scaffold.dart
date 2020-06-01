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
      drawerScrimColor: Colors.black54,
      key: Key(Keys.tabBar),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
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
      color: Colors.blue,
      shape: const CircularNotchedRectangle(),
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.blue,
        currentIndex: selectedIndex,
        key: Key(Keys.tabBar),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.supervised_user_circle,
              color: Colors.white,
            ),
            title: const Text('Contacts'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: const Text('Templates'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.assignment,
              color: Colors.white,
            ),
            title: const Text('Inspections'),
          ),
        ],
        onTap: _onTabTapped,
      ),
    );
  }
}
