import 'package:flutter/material.dart';
import 'package:quickspecpro/routing/router.gr.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(Router.contactsPage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text('Contacts Page'),
        ),
      ],
    );
  }

}
