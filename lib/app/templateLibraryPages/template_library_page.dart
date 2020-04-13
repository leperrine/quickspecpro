import 'package:flutter/material.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';

class TemplateLibraryPage extends StatelessWidget {
  const TemplateLibraryPage({Key key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(Router.templateLibraryPage);
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
          body: Column(
        children: <Widget>[
          Center(
            child: Text('Template Library Page'),
          ),
        ],
      ),
    );
  }
}
