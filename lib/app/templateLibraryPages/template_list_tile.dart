import 'package:flutter/material.dart';
import 'package:quickspecpro/app/models/template/template.dart';


class TemplateListTile extends StatelessWidget {
  const TemplateListTile({Key key, @required this.template, this.onTap}) : super(key: key);
  final Template template;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(template.title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}