import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_contact_page.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_sections_page.dart';

import 'package:quickspecpro/app/models/inspection/inspection.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/shared/buttons/custom_raised_button.dart';
import 'package:quickspecpro/shared/text/icon_header_text.dart';
import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';
import 'package:quickspecpro/app/inspectionPages/inspection_list_tiles.dart';

class InspectionsPage extends StatelessWidget {
  const InspectionsPage({Key key});

  static Future<void> show(BuildContext context,
      {Inspection inspection}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.inspectionsPage,
    );
  }

  Future<void> _deleteInspection(
      BuildContext context, Inspection inspection) async {
    try {
      final database = Provider.of<FirestoreDatabase>(context, listen: false);
      await database.deleteInspection(inspection);
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
                headerText: 'Your Inspections', icon: Icons.assignment),
            FlatButton.icon(
              textColor: Colors.green,
              icon: Icon(Icons.add),
              label: Text('add new'),
              onPressed: () => NewInspectionContactPage.show(context),
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
    return StreamBuilder<List<Inspection>>(
      stream: database.inspectionsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Inspection>(
          snapshot: snapshot,
          itemBuilder: (context, inspection) => Dismissible(
            key: Key('inspection-${inspection.id}'),
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
            onDismissed: (direction) => _deleteInspection(context, inspection),
            child: InspectionListTile(
              inspection: inspection,
              onTap: () => NewInspectionSectionsPage.show(
                context,
                inspection: inspection,
              ),
            ),
          ),
        );
      },
    );
  }
}
