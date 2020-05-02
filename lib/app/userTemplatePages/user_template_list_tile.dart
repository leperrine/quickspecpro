import 'package:flutter/material.dart';

import 'package:quickspecpro/app/models/userTemplate/template.dart';


class UserTemplateListTile extends StatelessWidget {
  UserTemplateListTile({Key key, this.userTemplate, this.onTap});
  final UserTemplate userTemplate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
     // leading: Image.network(userTemplate.coverPhoto),
      title: Text(userTemplate.title),
      trailing: Text(userTemplate.description),
      onTap: onTap,
    );
  }
}
