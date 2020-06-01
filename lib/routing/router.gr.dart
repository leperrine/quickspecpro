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
import 'package:quickspecpro/app/accountPages/account_page.dart';
import 'package:quickspecpro/app/contactPages/contacts_page.dart';
import 'package:quickspecpro/app/contactPages/new_contact_page.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';
import 'package:quickspecpro/app/settingsPages/settings_page.dart';
import 'package:quickspecpro/app/templateLibraryPages/template_library_page.dart';
import 'package:quickspecpro/app/inspectionPages/inspections_page.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_contact_page.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_date_page.dart';
import 'package:quickspecpro/app/models/inspection/inspection.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_address_page.dart';
import 'package:quickspecpro/app/models/inspection/inspection_address.dart';
import 'package:quickspecpro/app/userTemplatePages/user_templates_page.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_page.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_sections_page.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_section_items_page.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_item_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_section_item_features_page.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item_feature.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_item_feature_page.dart';

class Router {
  static const authWidget = '/';
  static const loginPageBuilder = '/login-page-builder';
  static const accountPage = '/account-page';
  static const contactsPage = '/contacts-page';
  static const newContactPage = '/new-contact-page';
  static const settingsPage = '/settings-page';
  static const templateLibraryPage = '/template-library-page';
  static const inspectionsPage = '/inspections-page';
  static const newInspectionContactPage = '/new-inspection-contact-page';
  static const newInspectionDatePage = '/new-inspection-date-page';
  static const newInspectionAddressPage = '/new-inspection-address-page';
  static const userTemplatesPage = '/user-templates-page';
  static const newUserTemplatesPage = '/new-user-templates-page';
  static const userTemplateSectionsPage = '/user-template-sections-page';
  static const newUserTemplateSectionPage = '/new-user-template-section-page';
  static const userTemplateSectionItemsPage =
      '/user-template-section-items-page';
  static const newUserTemplateSectionItemPage =
      '/new-user-template-section-item-page';
  static const userTemplateSectionItemFeaturesPage =
      '/user-template-section-item-features-page';
  static const newUserTemplateSectionItemFeaturePage =
      '/new-user-template-section-item-feature-page';
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
      case Router.accountPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => AccountPage(key: typedArgs),
          settings: settings,
          fullscreenDialog: false,
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
      case Router.newContactPage:
        if (hasInvalidArgs<NewContactPageArguments>(args)) {
          return misTypedArgsRoute<NewContactPageArguments>(args);
        }
        final typedArgs =
            args as NewContactPageArguments ?? NewContactPageArguments();
        return MaterialPageRoute(
          builder: (_) =>
              NewContactPage(key: typedArgs.key, contact: typedArgs.contact),
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
      case Router.templateLibraryPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => TemplateLibraryPage(key: typedArgs),
          settings: settings,
        );
      case Router.inspectionsPage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute(
          builder: (_) => InspectionsPage(key: typedArgs),
          settings: settings,
          fullscreenDialog: false,
        );
      case Router.newInspectionContactPage:
        if (hasInvalidArgs<NewInspectionContactPageArguments>(args)) {
          return misTypedArgsRoute<NewInspectionContactPageArguments>(args);
        }
        final typedArgs = args as NewInspectionContactPageArguments ??
            NewInspectionContactPageArguments();
        return MaterialPageRoute(
          builder: (_) => NewInspectionContactPage(
              key: typedArgs.key, contact: typedArgs.contact),
          settings: settings,
        );
      case Router.newInspectionDatePage:
        if (hasInvalidArgs<NewInspectionDatePageArguments>(args)) {
          return misTypedArgsRoute<NewInspectionDatePageArguments>(args);
        }
        final typedArgs = args as NewInspectionDatePageArguments ??
            NewInspectionDatePageArguments();
        return MaterialPageRoute(
          builder: (_) => NewInspectionDatePage(
              key: typedArgs.key,
              contact: typedArgs.contact,
              inspection: typedArgs.inspection),
          settings: settings,
        );
      case Router.newInspectionAddressPage:
        if (hasInvalidArgs<NewInspectionAddressPageArguments>(args)) {
          return misTypedArgsRoute<NewInspectionAddressPageArguments>(args);
        }
        final typedArgs = args as NewInspectionAddressPageArguments ??
            NewInspectionAddressPageArguments();
        return MaterialPageRoute(
          builder: (_) => NewInspectionAddressPage(
              key: typedArgs.key,
              contact: typedArgs.contact,
              inspection: typedArgs.inspection,
              inspectionAddress: typedArgs.inspectionAddress),
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
          fullscreenDialog: false,
        );
      case Router.newUserTemplatesPage:
        if (hasInvalidArgs<NewUserTemplatesPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<NewUserTemplatesPageArguments>(args);
        }
        final typedArgs = args as NewUserTemplatesPageArguments;
        return MaterialPageRoute(
          builder: (_) => NewUserTemplatesPage(
              key: typedArgs.key, userTemplate: typedArgs.userTemplate),
          settings: settings,
        );
      case Router.userTemplateSectionsPage:
        if (hasInvalidArgs<UserTemplateSectionsPageArguments>(args)) {
          return misTypedArgsRoute<UserTemplateSectionsPageArguments>(args);
        }
        final typedArgs = args as UserTemplateSectionsPageArguments ??
            UserTemplateSectionsPageArguments();
        return MaterialPageRoute(
          builder: (_) => UserTemplateSectionsPage(
              key: typedArgs.key,
              userTemplate: typedArgs.userTemplate,
              userTemplateSection: typedArgs.userTemplateSection),
          settings: settings,
        );
      case Router.newUserTemplateSectionPage:
        if (hasInvalidArgs<NewUserTemplateSectionPageArguments>(args)) {
          return misTypedArgsRoute<NewUserTemplateSectionPageArguments>(args);
        }
        final typedArgs = args as NewUserTemplateSectionPageArguments ??
            NewUserTemplateSectionPageArguments();
        return MaterialPageRoute(
          builder: (_) => NewUserTemplateSectionPage(
              key: typedArgs.key,
              userTemplate: typedArgs.userTemplate,
              userTemplateSection: typedArgs.userTemplateSection),
          settings: settings,
        );
      case Router.userTemplateSectionItemsPage:
        if (hasInvalidArgs<UserTemplateSectionItemsPageArguments>(args)) {
          return misTypedArgsRoute<UserTemplateSectionItemsPageArguments>(args);
        }
        final typedArgs = args as UserTemplateSectionItemsPageArguments ??
            UserTemplateSectionItemsPageArguments();
        return MaterialPageRoute(
          builder: (_) => UserTemplateSectionItemsPage(
              key: typedArgs.key,
              userTemplate: typedArgs.userTemplate,
              userTemplateSection: typedArgs.userTemplateSection,
              userTemplateSectionItem: typedArgs.userTemplateSectionItem),
          settings: settings,
        );
      case Router.newUserTemplateSectionItemPage:
        if (hasInvalidArgs<NewUserTemplateSectionItemPageArguments>(args)) {
          return misTypedArgsRoute<NewUserTemplateSectionItemPageArguments>(
              args);
        }
        final typedArgs = args as NewUserTemplateSectionItemPageArguments ??
            NewUserTemplateSectionItemPageArguments();
        return MaterialPageRoute(
          builder: (_) => NewUserTemplateSectionItemPage(
              key: typedArgs.key,
              userTemplate: typedArgs.userTemplate,
              userTemplateSection: typedArgs.userTemplateSection,
              userTemplateSectionItem: typedArgs.userTemplateSectionItem),
          settings: settings,
        );
      case Router.userTemplateSectionItemFeaturesPage:
        if (hasInvalidArgs<UserTemplateSectionItemFeaturesPageArguments>(
            args)) {
          return misTypedArgsRoute<
              UserTemplateSectionItemFeaturesPageArguments>(args);
        }
        final typedArgs =
            args as UserTemplateSectionItemFeaturesPageArguments ??
                UserTemplateSectionItemFeaturesPageArguments();
        return MaterialPageRoute(
          builder: (_) => UserTemplateSectionItemFeaturesPage(
              key: typedArgs.key,
              userTemplateSection: typedArgs.userTemplateSection,
              userTemplateSectionItem: typedArgs.userTemplateSectionItem,
              userTemplateSectionItemFeature:
                  typedArgs.userTemplateSectionItemFeature),
          settings: settings,
        );
      case Router.newUserTemplateSectionItemFeaturePage:
        if (hasInvalidArgs<NewUserTemplateSectionItemFeaturePageArguments>(
            args)) {
          return misTypedArgsRoute<
              NewUserTemplateSectionItemFeaturePageArguments>(args);
        }
        final typedArgs =
            args as NewUserTemplateSectionItemFeaturePageArguments ??
                NewUserTemplateSectionItemFeaturePageArguments();
        return MaterialPageRoute(
          builder: (_) => NewUserTemplateSectionItemFeaturePage(
              key: typedArgs.key,
              userTemplateSection: typedArgs.userTemplateSection,
              userTemplateSectionItem: typedArgs.userTemplateSectionItem,
              userTemplateSectionItemFeature:
                  typedArgs.userTemplateSectionItemFeature),
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

//NewContactPage arguments holder class
class NewContactPageArguments {
  final Key key;
  final Contact contact;
  NewContactPageArguments({this.key, this.contact});
}

//NewInspectionContactPage arguments holder class
class NewInspectionContactPageArguments {
  final Key key;
  final Contact contact;
  NewInspectionContactPageArguments({this.key, this.contact});
}

//NewInspectionDatePage arguments holder class
class NewInspectionDatePageArguments {
  final Key key;
  final Contact contact;
  final Inspection inspection;
  NewInspectionDatePageArguments({this.key, this.contact, this.inspection});
}

//NewInspectionAddressPage arguments holder class
class NewInspectionAddressPageArguments {
  final Key key;
  final Contact contact;
  final Inspection inspection;
  final InspectionAddress inspectionAddress;
  NewInspectionAddressPageArguments(
      {this.key, this.contact, this.inspection, this.inspectionAddress});
}

//NewUserTemplatesPage arguments holder class
class NewUserTemplatesPageArguments {
  final Key key;
  final UserTemplate userTemplate;
  NewUserTemplatesPageArguments({this.key, @required this.userTemplate});
}

//UserTemplateSectionsPage arguments holder class
class UserTemplateSectionsPageArguments {
  final Key key;
  final UserTemplate userTemplate;
  final UserTemplateSection userTemplateSection;
  UserTemplateSectionsPageArguments(
      {this.key, this.userTemplate, this.userTemplateSection});
}

//NewUserTemplateSectionPage arguments holder class
class NewUserTemplateSectionPageArguments {
  final Key key;
  final UserTemplate userTemplate;
  final UserTemplateSection userTemplateSection;
  NewUserTemplateSectionPageArguments(
      {this.key, this.userTemplate, this.userTemplateSection});
}

//UserTemplateSectionItemsPage arguments holder class
class UserTemplateSectionItemsPageArguments {
  final Key key;
  final UserTemplate userTemplate;
  final UserTemplateSection userTemplateSection;
  final UserTemplateSectionItem userTemplateSectionItem;
  UserTemplateSectionItemsPageArguments(
      {this.key,
      this.userTemplate,
      this.userTemplateSection,
      this.userTemplateSectionItem});
}

//NewUserTemplateSectionItemPage arguments holder class
class NewUserTemplateSectionItemPageArguments {
  final Key key;
  final UserTemplate userTemplate;
  final UserTemplateSection userTemplateSection;
  final UserTemplateSectionItem userTemplateSectionItem;
  NewUserTemplateSectionItemPageArguments(
      {this.key,
      this.userTemplate,
      this.userTemplateSection,
      this.userTemplateSectionItem});
}

//UserTemplateSectionItemFeaturesPage arguments holder class
class UserTemplateSectionItemFeaturesPageArguments {
  final Key key;
  final UserTemplateSection userTemplateSection;
  final UserTemplateSectionItem userTemplateSectionItem;
  final UserTemplateSectionItemFeature userTemplateSectionItemFeature;
  UserTemplateSectionItemFeaturesPageArguments(
      {this.key,
      this.userTemplateSection,
      this.userTemplateSectionItem,
      this.userTemplateSectionItemFeature});
}

//NewUserTemplateSectionItemFeaturePage arguments holder class
class NewUserTemplateSectionItemFeaturePageArguments {
  final Key key;
  final UserTemplateSection userTemplateSection;
  final UserTemplateSectionItem userTemplateSectionItem;
  final UserTemplateSectionItemFeature userTemplateSectionItemFeature;
  NewUserTemplateSectionItemFeaturePageArguments(
      {this.key,
      this.userTemplateSection,
      this.userTemplateSectionItem,
      this.userTemplateSectionItemFeature});
}
