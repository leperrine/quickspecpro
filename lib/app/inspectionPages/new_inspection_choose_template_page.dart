import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quickspecpro/app/inspectionPages/inspection_form_next_button_green.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_sections_page.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';
import 'package:quickspecpro/app/models/inspection/inspection.dart';
import 'package:quickspecpro/app/models/inspection/inspection_address.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_list_tiles.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/shared/buttons/custom_raised_button.dart';
import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';
import 'package:quickspecpro/shared/text/orange_header_text.dart';

class NewInspectionChooseTemplatePage extends StatefulWidget {
  NewInspectionChooseTemplatePage({
    Key key,
    this.contact,
    this.inspection,
  });
  final Contact contact;
  final Inspection inspection;

  @override
  _NewInspectionChooseTemplatePageState createState() =>
      _NewInspectionChooseTemplatePageState();

  static Future<void> show(BuildContext context,
      {Inspection inspection, Contact contact}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newInspectionChooseTemplatePage,
      arguments: NewInspectionChooseTemplatePageArguments(
          inspection: inspection, contact: contact),
    );
  }
}

class _NewInspectionChooseTemplatePageState
    extends State<NewInspectionChooseTemplatePage> {
  String _templateId;

  Future<void> _submit() async {
    try {
      final database = Provider.of<FirestoreDatabase>(context, listen: false);
      final id = widget.inspection?.id ?? documentIdFromCurrentDate();
      final newInspection = Inspection(
        id: id,
        templateId: _templateId,
        date: widget.inspection?.date ?? null,
        address: widget.inspection.address,
      );
      await database.setInspection(newInspection);
      Navigator.of(context).pop();
      NewInspectionSectionsPage.show(context);
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
    return StreamBuilder<List<UserTemplate>>(
        stream: database.userTemplatesStream(),
        builder: (context, snapshot) {
          return ListItemsBuilder<UserTemplate>(
              snapshot: snapshot,
              itemBuilder: (context, userTemplate) => UserTemplateListTile(
                  userTemplate: userTemplate,
                  onTap: () {
                    setState(() {
                      _templateId = userTemplate.id;
                    });
                    _submit();
                  }));
        });
  }
}
