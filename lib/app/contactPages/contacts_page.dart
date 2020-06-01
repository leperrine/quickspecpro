import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickspecpro/app/contactPages/contact_list_tile.dart';
import 'package:quickspecpro/app/contactPages/new_contact_page.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';

import 'package:quickspecpro/app/models/inspection/inspection.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/shared/buttons/custom_raised_button.dart';
import 'package:quickspecpro/shared/text/icon_header_text.dart';
import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key key});

  static Future<void> show(BuildContext context,
      {Inspection inspection}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.contactsPage,
    );
  }

  Future<void> _deleteContact(BuildContext context, Contact contact) async {
    try {
      final database = Provider.of<FirestoreDatabase>(context, listen: false);
      await database.deleteContact(contact);
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
            IconHeaderText(
                headerText: 'Your Contacts',
                icon: Icons.supervised_user_circle),
            FlatButton.icon(
              textColor: Colors.green,
              icon: Icon(Icons.add),
              label: Text('add new'),
              onPressed: () => NewContactPage.show(context),
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
    return StreamBuilder<List<Contact>>(
      stream: database.contactsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Contact>(
          snapshot: snapshot,
          itemBuilder: (context, contact) => Dismissible(
            key: Key('contact-${contact.id}'),
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
                  content:
                      Text('Do you want to delete this inspection template?'),
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
            onDismissed: (direction) => _deleteContact(context, contact),
            child: ContactListTile(
              contact: contact,
              onTap: () => NewContactPage.show(
                context,
                contact: contact,
              ),
            ),
          ),
        );
      },
    );
  }
}
