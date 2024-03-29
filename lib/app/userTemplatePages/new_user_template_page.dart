import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:quickspecpro/app/userTemplatePages/user_template_sections_page.dart';

import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/shared/platform_alert_dialog.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';


class NewUserTemplatesPage extends StatefulWidget {
  const NewUserTemplatesPage({
    Key key,
    @required this.userTemplate,
  }) : super(key: key);

  final UserTemplate userTemplate;

  static Future<void> show(BuildContext context,
      {UserTemplate userTemplate}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newUserTemplatesPage,
      arguments: NewUserTemplatesPageArguments(userTemplate: userTemplate),
    );
  }

  @override
  _NewUserTemplatesPageState createState() => _NewUserTemplatesPageState();
}

class _NewUserTemplatesPageState extends State<NewUserTemplatesPage> {
  // Form State Objects
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _description;
  String _coverPhoto;

  @override
  void initState() {
    super.initState();
    if (widget.userTemplate != null) {
      _title = widget.userTemplate.title;
      _description = widget.userTemplate.description;
      _coverPhoto = widget.userTemplate.coverPhoto;
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
        final userTemplate = await database.userTemplatesStream().first;
        final allLowerCaseNames = userTemplate
            .map((userTemplate) => userTemplate.title.toLowerCase())
            .toList();
        if (widget.userTemplate != null) {
          allLowerCaseNames.remove(widget.userTemplate.title.toLowerCase());
        }
        if (allLowerCaseNames.contains(_title.toLowerCase())) {
          PlatformAlertDialog(
            title: 'Name Already Used',
            content: 'Please Enter A Different Template Name',
            defaultActionText: 'OK',
          ).show(context);
        } else {
          final id = widget.userTemplate?.id ?? documentIdFromCurrentDate();
          final userTemplate = UserTemplate(
            id: id,
            title: _title,
            description: _description,
            coverPhoto: _coverPhoto,
          );
          await database.setUserTemplate(userTemplate);
          Navigator.of(context).pop();
          UserTemplateSectionsPage.show(
              context: context, userTemplate: userTemplate);
        }
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
        decoration: InputDecoration(labelText: 'Template Title'),
        keyboardAppearance: Brightness.light,
        initialValue: _title,
        validator: (value) => value.isNotEmpty ? null : 'Title can\'t be empty',
        onSaved: (value) => _title = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Description'),
        keyboardAppearance: Brightness.light,
        initialValue: _description,
        validator: (value) =>
            value.isNotEmpty ? null : 'Description can\'t be empty',
        onSaved: (value) => _description = value,
      ),
    ];
  }
}
