import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quickspecpro/app/models/userTemplate/template.dart';
import 'package:quickspecpro/app/userTemplatePages/new_template_page.dart';
import 'package:quickspecpro/app/userTemplatePages/template_sections_page.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_list_tile.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';

class UserTemplatesPage extends StatelessWidget {
  const UserTemplatesPage({Key key});

  static Future<void> show(BuildContext context,
      {UserTemplate userTemplate}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.userTemplatesPage,
    );
  }

  Future<void> _deleteUserTemplate(
      BuildContext context, UserTemplate userTemplate) async {
    try {
      final database = Provider.of<FirestoreDatabase>(context, listen: false);
      await database.deleteUserTemplate(userTemplate);
    } catch (e) {
      PlatformExceptionAlertDialog(
        exception: e,
        title: 'An Error Has Occured',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Text(
                'Your Templates',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            FlatButton.icon(
              textColor: Colors.green,
              icon: Icon(Icons.add),
              label: Text('add new'),
              onPressed: () => NewTemplatesPage.show(context),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: _buildContents(context),
        ),
      ],
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<FirestoreDatabase>(context, listen: false);
    return StreamBuilder<List<UserTemplate>>(
      stream: database.userTemplatesStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<UserTemplate>(
          snapshot: snapshot,
          itemBuilder: (context, userTemplate) => Dismissible(
            key: Key('userTemplate-${userTemplate.id}'),
            background: Container(
              color: Colors.red,
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) =>
                _deleteUserTemplate(context, userTemplate),
            child: UserTemplateListTile(
              userTemplate: userTemplate,
              onTap: () =>
                  TemplateSectionsPage.show(context, userTemplate: userTemplate),
            ),
          ),
        );
      },
    );
  }
}
