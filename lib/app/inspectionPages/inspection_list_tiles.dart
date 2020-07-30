import 'package:flutter/material.dart';

import 'package:quickspecpro/app/models/inspection/inspection.dart';

class InspectionListTile extends StatelessWidget {
  InspectionListTile({Key key, this.inspection, this.onTap});
  final Inspection inspection;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var parsedDate = DateTime.parse(inspection.date.toString());
    var formattedDate =
        '${parsedDate.month}-${parsedDate.day}-${parsedDate.year}';
    var formattedAddress =
        '${inspection.address.streetAddress}, ${inspection.address.city} ${inspection.address.state} ${inspection.address.zipCode}';
    return ListTile(
      title: inspection.address != null
          ? Text(formattedAddress)
          : Text('Address Not Found'),
      trailing: inspection.date != null
          ? Text(formattedDate)
          : Text('Date Not Found'),
      onTap: onTap,
    );
  }
}
