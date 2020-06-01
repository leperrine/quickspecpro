import 'package:auto_route/auto_route_annotations.dart';
import 'package:quickspecpro/app/auth/auth_widget.dart';
import 'package:quickspecpro/app/auth/login_page.dart';
import 'package:quickspecpro/app/contactPages/contacts_page.dart';
import 'package:quickspecpro/app/contactPages/new_contact_page.dart';
import 'package:quickspecpro/app/inspectionPages/inspections_page.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_address_page.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_contact_page.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_date_page.dart';
import 'package:quickspecpro/app/settingsPages/settings_page.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_item_feature_page.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_page.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_page.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_item_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_section_item_features_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_sections_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_section_items_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_templates_page.dart';
import 'package:quickspecpro/app/templateLibraryPages/template_library_page.dart';
import 'package:quickspecpro/app/accountPages/account_page.dart';

@autoRouter
class $Router {
  @initial
  AuthWidget authWidget;

  @MaterialRoute(fullscreenDialog: true)
  LoginPageBuilder loginPageBuilder;

  // General Page Routes
  @MaterialRoute(fullscreenDialog: false)
  AccountPage accountPage;
  ContactsPage contactsPage;
  NewContactPage newContactPage;
  SettingsPage settingsPage;
  TemplateLibraryPage templateLibraryPage;

  // Inspection Page Routes
  @MaterialRoute(fullscreenDialog: false)
  InspectionsPage inspectionsPage;
  NewInspectionContactPage newInspectionContactPage;
  NewInspectionDatePage newInspectionDatePage;
  NewInspectionAddressPage newInspectionAddressPage;

  // User Template Page Routes
  @MaterialRoute(fullscreenDialog: false)
  UserTemplatesPage userTemplatesPage;
  NewUserTemplatesPage newUserTemplatesPage;
  UserTemplateSectionsPage userTemplateSectionsPage;
  NewUserTemplateSectionPage newUserTemplateSectionPage;
  UserTemplateSectionItemsPage userTemplateSectionItemsPage; 
  NewUserTemplateSectionItemPage newUserTemplateSectionItemPage;
  UserTemplateSectionItemFeaturesPage userTemplateSectionItemFeaturesPage;
  NewUserTemplateSectionItemFeaturePage newUserTemplateSectionItemFeaturePage;
}