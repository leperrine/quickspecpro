import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_section_items_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_list_tiles.dart';

import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/shared/buttons/custom_raised_button.dart';
import 'package:quickspecpro/shared/text/icon_header_text.dart';
import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';

class UserTemplateSectionsPage extends StatelessWidget {
  UserTemplateSectionsPage({
    Key key,
    this.userTemplate,
    this.userTemplateSection,
  }) : super(key: key);
  final UserTemplate userTemplate;
  final UserTemplateSection userTemplateSection;

  static Future<void> show({
    BuildContext context,
    UserTemplate userTemplate,
    UserTemplateSection userTemplateSection,
  }) async {
    await Navigator.of(context).pushNamed(
      Router.userTemplateSectionsPage,
      arguments: UserTemplateSectionsPageArguments(
        userTemplate: userTemplate,
        userTemplateSection: userTemplateSection,
      ),
    );
  }

  Future<void> _deleteUserTemplateSection(
      BuildContext context, UserTemplateSection userTemplateSection) async {
    try {
      final database = Provider.of<FirestoreDatabase>(context, listen: false);
      await database.deleteAllUserTemplateSectionItems(userTemplateSection);
      await database.deleteUserTemplateSection(userTemplateSection);
    } catch (e) {
      PlatformExceptionAlertDialog(
        exception: e,
        title: 'An Error Has Occured',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          
              IconHeaderText(icon: Icons.dashboard, headerText: 'Template Sections'),
              FlatButton.icon(
                textColor: Colors.green,
                icon: Icon(Icons.add),
                label: Text('add new'),
                onPressed: () => NewUserTemplateSectionPage.show(
                  context,
                  userTemplate: userTemplate,
                  userTemplateSection: userTemplateSection,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: _buildContents(context),
          ),
        ],
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<FirestoreDatabase>(context, listen: false);
    return StreamBuilder<List<UserTemplateSection>>(
      stream:
          database.userTemplateSectionsStream(userTemplateId: userTemplate.id),
      builder: (context, snapshot) {
        return ListItemsBuilder<UserTemplateSection>(
          snapshot: snapshot,
          itemBuilder: (context, userTemplateSection) => Dismissible(
            key: Key('userTemplateSection-${userTemplateSection.id}'),
            background: Container(
              color: Colors.red[600],
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              //margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            ),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Are You Sure?'),
                  content: Text('Do you want to delete this template section?'),
                  actions: <Widget>[
                    CustomRaisedButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    CustomRaisedButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                ),
              );
            },
            onDismissed: (direction) =>
                _deleteUserTemplateSection(context, userTemplateSection),
            child: UserTemplateSectionListTile(
              userTemplateSection: userTemplateSection,
              onTap: () => UserTemplateSectionItemsPage.show(
                context: context,
                userTemplate: userTemplate,
                userTemplateSection: userTemplateSection,
              ),
            ),
          ),
        );
      },
    );
  }
}
