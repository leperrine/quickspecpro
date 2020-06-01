import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item_feature.dart';
import 'package:quickspecpro/app/userTemplatePages/new_user_template_section_item_feature_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_list_tiles.dart';

import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/shared/buttons/custom_raised_button.dart';
import 'package:quickspecpro/shared/text/icon_header_text.dart';
import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';

class UserTemplateSectionItemFeaturesPage extends StatelessWidget {
  UserTemplateSectionItemFeaturesPage({
    Key key,
    this.userTemplateSection,
    this.userTemplateSectionItem,
    this.userTemplateSectionItemFeature,
  }) : super(key: key);
  final UserTemplateSection userTemplateSection;
  final UserTemplateSectionItem userTemplateSectionItem;
  final UserTemplateSectionItemFeature userTemplateSectionItemFeature;

  static Future<void> show({
    BuildContext context,
    UserTemplateSection userTemplateSection,
    UserTemplateSectionItem userTemplateSectionItem,
    UserTemplateSectionItemFeature userTemplateSectionItemFeature,
  }) async {
    await Navigator.of(context).pushNamed(
      Router.userTemplateSectionItemFeaturesPage,
      arguments: UserTemplateSectionItemFeaturesPageArguments(
        userTemplateSection: userTemplateSection,
        userTemplateSectionItem: userTemplateSectionItem,
        userTemplateSectionItemFeature: userTemplateSectionItemFeature,
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
              IconHeaderText(
                  icon: Icons.dashboard, headerText: 'Item Features'),
              FlatButton.icon(
                textColor: Colors.green,
                icon: Icon(Icons.add),
                label: Text('add new'),
                onPressed: () => NewUserTemplateSectionItemFeaturePage.show(
                  context,
                  userTemplateSection: userTemplateSection,
                  userTemplateSectionItem: userTemplateSectionItem,
                  userTemplateSectionItemFeature:
                      userTemplateSectionItemFeature,
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
    return StreamBuilder<List<UserTemplateSectionItemFeature>>(
      stream: database.userTemplateSectionItemFeaturesStream(
        userTemplateSection: userTemplateSection,
        userTemplateSectionItem: userTemplateSectionItem,
      ),
      builder: (context, snapshot) {
        return ListItemsBuilder<UserTemplateSectionItemFeature>(
          snapshot: snapshot,
          itemBuilder: (context, userTemplateSectionItemFeature) => Dismissible(
            key: Key(
                'userTemplateSectionItemFeature-${userTemplateSectionItemFeature.hashCode}'),
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
                database.deleteUserTemplateSectionItemFeature(
              userTemplateSection: userTemplateSection,
              userTemplateSectionItem: userTemplateSectionItem,
              userTemplateSectionItemFeature: userTemplateSectionItemFeature,
            ),
            child: UserTemplateSectionItemFeatureListTile(
              userTemplateSectionItemFeature: userTemplateSectionItemFeature,
              onTap: () => NewUserTemplateSectionItemFeaturePage.show(
                context,
                userTemplateSection: userTemplateSection,
                userTemplateSectionItem: userTemplateSectionItem,
                userTemplateSectionItemFeature: userTemplateSectionItemFeature,
              ),
            ),
          ),
        );
      },
    );
  }
}
