import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_sections_page.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';

class NewUserTemplateSectionPage extends StatefulWidget {
  const NewUserTemplateSectionPage({
    Key key,
    this.userTemplate,
    this.userTemplateSection,
  }) : super(key: key);

  final UserTemplate userTemplate;
  final UserTemplateSection userTemplateSection;

  static Future<void> show(
    BuildContext context, {
    UserTemplate userTemplate,
    UserTemplateSection userTemplateSection,
  }) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newUserTemplateSectionPage,
      arguments: NewUserTemplateSectionPageArguments(
        userTemplate: userTemplate,
        userTemplateSection: userTemplateSection,
      ),
    );
  }

  @override
  _NewUserTemplateSectionPageState createState() =>
      _NewUserTemplateSectionPageState();
}

class _NewUserTemplateSectionPageState
    extends State<NewUserTemplateSectionPage> {
  // Form State Objects
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _summary;

  @override
  void initState() {
    super.initState();
    if (widget.userTemplateSection != null) {
      _title = widget.userTemplateSection.title;
      _summary = widget.userTemplateSection.summary;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      try {
        final database = Provider.of<FirestoreDatabase>(context, listen: false);
        final id = widget.userTemplateSection?.id ?? documentIdFromCurrentDate();
        final userTemplateSection = UserTemplateSection(
          id: id,
          title: _title,
          summary: _summary,
        );
        await database
            .setUserTemplateSection(userTemplateSection)
            .then((_) => database.addUserTemplateIdtoSection(
                  userTemplateId: widget.userTemplate.id,
                  userTemplateSectionId: userTemplateSection.id,
                ));
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        UserTemplateSectionsPage.show(
          context: context,
          userTemplate: widget.userTemplate,
          userTemplateSection: userTemplateSection,
        );
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Operation Failed',
          exception: e,
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildForm(),
                ),
              ),
              SizedBox(height: 10.0),
              //MediaButton(uid: widget.userSnapshot.data.uid, userTemplateId: widget.userTemplate.id),
              FlatButton.icon(
                onPressed: _submit,
                icon: Icon(Icons.save),
                label: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildFormChildren()),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Section Title'),
        keyboardAppearance: Brightness.light,
        initialValue: _title,
        validator: (value) => value.isNotEmpty ? null : 'Title can\'t be empty',
        onSaved: (value) => _title = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Summary'),
        keyboardAppearance: Brightness.light,
        initialValue: _summary,
        validator: (value) =>
            value.isNotEmpty ? null : 'Description can\'t be empty',
        onSaved: (value) => _summary = value,
      ),
    ];
  }
}
