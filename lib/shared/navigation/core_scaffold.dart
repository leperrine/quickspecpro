import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:quickspecpro/app/contactPages/contacts_page.dart';
import 'package:quickspecpro/constants/keys.dart';
import 'package:quickspecpro/app/inspectionPages/inspections_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_templates_page.dart';
import 'package:quickspecpro/shared/navigation/core_drawer.dart';

class CoreScaffold extends StatefulWidget {
  const CoreScaffold({
    Key key,
  }) : super(key: key);

  @override
  _CoreScaffoldState createState() => _CoreScaffoldState();
}

class _CoreScaffoldState extends State<CoreScaffold> {
  int _currentTab = 0;
  final List<Widget> _pages = <Widget>[
    ContactsPage(),
    UserTemplatesPage(),
    InspectionsPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String logo = 'assets/logo.svg';
    final Widget svg = SvgPicture.asset(
      logo,
      semanticsLabel: 'Quick Spec Pro',
      height: 80.0,
    );
    return Scaffold(
      key: Key(Keys.tabBar),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      // ),
      appBar: AppBar(
        elevation: 5,
        actions: <Widget>[svg],
      ),
      drawer: CoreDrawer(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          fixedColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black87,
          unselectedIconTheme: IconThemeData(color: Colors.black87),
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _currentTab,
          key: Key(Keys.tabBar),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('Contacts')),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), title: Text('Templates')),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), title: Text('Inspections')),
          ],
          onTap: (index) {
            setState(() {
              _currentTab = index;
            });
          },
        ),
      ),
      body: Center(
        child: _pages[_currentTab],
      ),
      // bottomNavigationBar: AppTabBar,
    );
  }
}
