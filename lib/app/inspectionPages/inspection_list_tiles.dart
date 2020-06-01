import 'package:flutter/material.dart';

import 'package:quickspecpro/app/models/inspection/inspection.dart';

class InspectionListTile extends StatelessWidget {
  InspectionListTile({Key key, this.inspection, this.onTap});
  final Inspection inspection;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(userTemplate.coverPhoto),
      title: inspection.title != null
          ? Text(inspection.title)
          : Text('Title Not Found'),
      trailing: inspection.description != null
          ? Text(inspection.description)
          : Text('Description Not Found'),
      onTap: onTap,
    );
  }
}