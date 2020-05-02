

import 'package:auto_route/auto_route_annotations.dart';
import 'package:quickspecpro/app/auth/auth_widget.dart';
import 'package:quickspecpro/app/auth/login_page.dart';
import 'package:quickspecpro/app/contactPages/contacts_page.dart';
import 'package:quickspecpro/app/inspectionPages/inspections_page.dart';
import 'package:quickspecpro/app/settingsPages/settings_page.dart';
import 'package:quickspecpro/app/userTemplatePages/new_template_page.dart';
import 'package:quickspecpro/app/userTemplatePages/template_sections_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_templates_page.dart';
import 'package:quickspecpro/app/templateLibraryPages/template_library_page.dart';
import 'package:quickspecpro/app/accountPages/account_page.dart';

@autoRouter
class $Router {
  @initial
  AuthWidget authWidget;

  @MaterialRoute(fullscreenDialog: true)
  LoginPageBuilder loginPageBuilder;

  @MaterialRoute(fullscreenDialog: false)
  UserTemplatesPage userTemplatesPage;

  @MaterialRoute(fullscreenDialog: false)
  InspectionsPage inspectionsPage;
  TemplateLibraryPage templateLibraryPage;
  NewTemplatesPage newTemplatesPage;
  AccountPage accountPage;
  ContactsPage contactsPage;
  SettingsPage settingsPage;
  TemplateSectionsPage templateSectionsPage;
}