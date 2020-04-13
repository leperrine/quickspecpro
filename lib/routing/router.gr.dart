// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:quickspecpro/app/auth/auth_widget.dart';
import 'package:quickspecpro/services/firebase_auth_service.dart';
import 'package:quickspecpro/app/auth/login_page.dart';
import 'package:quickspecpro/app/inspectionPages/inspections_page.dart';
import 'package:quickspecpro/app/templateLibraryPages/template_library_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_templates_page.dart';
import 'package:quickspecpro/app/userTemplatePages/new_template_page.dart';
import 'package:quickspecpro/app/models/userTemplate/template.dart';
import 'package:quickspecpro/app/accountPages/account_page.dart';
import 'package:quickspecpro/app/contactPages/contacts_page.dart';
import 'package:quickspecpro/app/settingsPages/settings_page.dart';
import 'package:quickspecpro/app/userTemplatePages/template_sections_page.dart';

class Router {
  static const authWidget = '/';
  static const loginPageBuilder = '/login-page-builder';
  static const inspectionsPage = '/inspections-page';
  static const templateLibraryPage = '/template-library-page';
  static const userTemplatesPage = '/user-templates-page';
  static const newTemplatesPage = '/new-templates-page';
  static const accountPage = '/account-page';
  static const contactsPage = '/contacts-page';
  static const settingsPage = '/settings-page';
  static const templateSectionsPage = '/template-sections-page';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.authWidget:
        if (hasInvalidArgs<AuthWidgetArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<AuthWidgetArguments>(args);
        }
        final typedArgs = args as AuthWidgetArguments;
        return MaterialPageRoute(
          builder: (_) => AuthWidget(
              key: typedArgs.key, userSnapshot: typedArgs.userSnapshot),
          settings: settings,
        );
      case Router.loginPageBuilder:
        if (hasInvalidArgs<LoginPageBuilderArguments>(args)) {
          return misTypedArgsRoute<LoginPageBuilderArguments>(args);
        }
        final typedArgs =
            args as LoginPageBuilderArguments ?? LoginPageBuilderArguments();
        return MaterialPageRoute(
          builder: (_) => LoginPageBuilder(
              key: typedArgs.key, onSignedIn: typedArgs.onSignedIn),
          settings: settings,
          fullscreenDialog: true,
        );
      case Router.inspectionsPage:
        return MaterialPageRoute(
          builder: (_) => InspectionsPage(),
          settings: settings,
          fullscreenDialog: false,
        );
      case Router.templateLibraryPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => TemplateLibraryPage(key: typedArgs),
          settings: settings,
        );
      case Router.userTemplatesPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => UserTemplatesPage(key: typedArgs),
          settings: settings,
        );
      case Router.newTemplatesPage:
        if (hasInvalidArgs<NewTemplatesPageArguments>(args)) {
          return misTypedArgsRoute<NewTemplatesPageArguments>(args);
        }
        final typedArgs =
            args as NewTemplatesPageArguments ?? NewTemplatesPageArguments();
        return MaterialPageRoute(
          builder: (_) => NewTemplatesPage(
              key: typedArgs.key, userTemplate: typedArgs.userTemplate),
          settings: settings,
        );
      case Router.accountPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => AccountPage(key: typedArgs),
          settings: settings,
        );
      case Router.contactsPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => ContactsPage(key: typedArgs),
          settings: settings,
        );
      case Router.settingsPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => SettingsPage(key: typedArgs),
          settings: settings,
        );
      case Router.templateSectionsPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => TemplateSectionsPage(key: typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//AuthWidget arguments holder class
class AuthWidgetArguments {
  final Key key;
  final AsyncSnapshot<User> userSnapshot;
  AuthWidgetArguments({this.key, @required this.userSnapshot});
}

//LoginPageBuilder arguments holder class
class LoginPageBuilderArguments {
  final Key key;
  final void Function() onSignedIn;
  LoginPageBuilderArguments({this.key, this.onSignedIn});
}

//NewTemplatesPage arguments holder class
class NewTemplatesPageArguments {
  final Key key;
  final UserTemplate userTemplate;
  NewTemplatesPageArguments({this.key, this.userTemplate});
}
