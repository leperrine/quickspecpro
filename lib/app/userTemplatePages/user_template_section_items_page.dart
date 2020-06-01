import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_item_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_section_item_features_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_list_tiles.dart';

import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/shared/buttons/custom_raised_button.dart';
import 'package:quickspecpro/shared/text/icon_header_text.dart';
import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';

class UserTemplateSectionItemsPage extends StatelessWidget {
  UserTemplateSectionItemsPage({
    Key key,
    this.userTemplate,
    this.userTemplateSection,
    this.userTemplateSectionItem,
  }) : super(key: key);
  final UserTemplate userTemplate;
  final UserTemplateSection userTemplateSection;
  final UserTemplateSectionItem userTemplateSectionItem;

  static Future<void> show({
    BuildContext context,
    UserTemplate userTemplate,
    UserTemplateSection userTemplateSection,
    UserTemplateSectionItem userTemplateSectionItem,
  }) async {
    await Navigator.of(context).pushNamed(
      Router.userTemplateSectionItemsPage,
      arguments: UserTemplateSectionItemsPageArguments(
        userTemplate: userTemplate,
        userTemplateSection: userTemplateSection,
        userTemplateSectionItem: userTemplateSectionItem,
      ),
    );
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
              IconHeaderText(icon: Icons.dashboard, headerText: 'Section Items'),
              FlatButton.icon(
                textColor: Colors.green,
                icon: Icon(Icons.add),
                label: Text('add new'),
                onPressed: () => NewUserTemplateSectionItemPage.show(
                  context,
                  userTemplate: userTemplate,
                  userTemplateSection: userTemplateSection,
                  userTemplateSectionItem: userTemplateSectionItem,
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
    return StreamBuilder<List<UserTemplateSectionItem>>(
      stream: database.userTemplateSectionItemsStream(userTemplateSection.id),
      builder: (context, snapshot) {
        return ListItemsBuilder<UserTemplateSectionItem>(
          snapshot: snapshot,
          itemBuilder: (context, userTemplateSectionItem) => Dismissible(
            key: Key('userTemplateSectionItem-${userTemplateSectionItem.id}'),
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
            onDismissed: (direction) => database.deleteUserTemplateSectionItem(
                userTemplateSection, userTemplateSectionItem),
            child: UserTemplateSectionItemListTile(
              userTemplateSectionItem: userTemplateSectionItem,
              onTap: () => UserTemplateSectionItemFeaturesPage.show(
                context: context,
                userTemplateSection: userTemplateSection,
                userTemplateSectionItem: userTemplateSectionItem,
              ),
            ),
          ),
        );
      },
    );
  }
}
