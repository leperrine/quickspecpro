import 'package:flutter/material.dart';
import 'package:quickspecpro/app/userTemplatePages/new_template_page.dart';

import 'package:quickspecpro/shared/empty_content.dart';

class UserTemplatesPage extends StatelessWidget {
  const UserTemplatesPage({Key key}) : super(key: key);

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
                'User Templates Page',
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
        EmptyContent()
      ],
    );
  }
}
