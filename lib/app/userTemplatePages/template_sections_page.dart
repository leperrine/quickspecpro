import 'package:flutter/material.dart';

import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';

class TemplateSectionsPage extends StatelessWidget {
  const TemplateSectionsPage({Key key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(Router.templateSectionsPage);
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
          body: Column(
        children: <Widget>[
          Center(
            child: Text('Account Page'),
          ),
        ],
      ),
    );
  }
}
