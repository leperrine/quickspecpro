import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';
import 'package:quickspecpro/app/models/inspection/inspection.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_list_tiles.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';
import 'package:quickspecpro/shared/text/orange_header_text.dart';

class NewInspectionSectionsPage extends StatefulWidget {
  NewInspectionSectionsPage({
    Key key,
    this.contact,
    this.inspection,
  });
  final Contact contact;
  final Inspection inspection;

  @override
  _NewInspectionSectionsPageState createState() =>
      _NewInspectionSectionsPageState();

  static Future<void> show(BuildContext context,
      {Inspection inspection, Contact contact}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newInspectionChooseTemplatePage,
      arguments: NewInspectionChooseTemplatePageArguments(
          inspection: inspection, contact: contact),
    );
  }
}

class _NewInspectionSectionsPageState extends State<NewInspectionSectionsPage> {
  String _templateId;

  Future<void> _submit() async {
    try {
      final database = Provider.of<FirestoreDatabase>(context, listen: false);
      final id = widget.inspection?.id ?? documentIdFromCurrentDate();
      // final inspectionAddress = InspectionAddress(
      //   streetAddress: widget.inspection.address.streetAddress,
      //   city: _city,
      //   state: _state,
      //   zipCode: _zipCode,
      // );
      // final inspection = Inspection(
      //   id: id,
      //   date: widget.inspection?.date ?? null,
      //   address: inspectionAddress,
      // );
      // await database.setInspection(inspection);
      Navigator.of(context).pop();
      //NewInspectionAddressPage.show(context, inspection: inspection);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Operation Failed',
        exception: e,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            OrangeHeaderText(
              text: 'Pick an inspection template',
            ),
            SizedBox(height: 10.0),
            Expanded(child: _buildContents(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<FirestoreDatabase>(context, listen: false);
    return StreamBuilder<List<UserTemplateSection>>(
        stream: database.userTemplateSectionsStream(
            userTemplateId: widget.inspection.templateId),
        builder: (context, snapshot) {
          return ListItemsBuilder<UserTemplateSection>(
              snapshot: snapshot,
              itemBuilder: (context, userTemplateSection) =>
                  UserTemplateSectionListTile(
                      key: Key('userTemplateSection-${userTemplateSection.id}'),
                      userTemplateSection: userTemplateSection,
                      onTap: () {
                        setState(() {
                          // _templateId = userTemplate.id;
                        });
                      }));
        });
  }
}
