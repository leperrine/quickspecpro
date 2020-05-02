import 'package:flutter/material.dart';
import 'package:quickspecpro/app/contactPages/contacts_page.dart';
import 'package:quickspecpro/app/inspectionPages/inspections_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_templates_page.dart';


class BottomNavBarPages {
  

  List<Widget> get bottomNavBarPages => pages;

  List<Widget> pages = <Widget>[
    ContactsPage(),
    UserTemplatesPage(),
    InspectionsPage(),
  ];

}
