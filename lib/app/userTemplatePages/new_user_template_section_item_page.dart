import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item.dart';

import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_section_items_page.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';

class NewUserTemplateSectionItemPage extends StatefulWidget {
  const NewUserTemplateSectionItemPage({
    Key key,
    this.userTemplate,
    this.userTemplateSection,
    this.userTemplateSectionItem,
  }) : super(key: key);
  final UserTemplate userTemplate;
  final UserTemplateSection userTemplateSection;
  final UserTemplateSectionItem userTemplateSectionItem;

  static Future<void> show(
    BuildContext context, {
    UserTemplate userTemplate,
    UserTemplateSection userTemplateSection,
    UserTemplateSectionItem userTemplateSectionItem,
  }) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newUserTemplateSectionItemPage,
      arguments: NewUserTemplateSectionItemPageArguments(
        userTemplate: userTemplate,
        userTemplateSection: userTemplateSection,
        userTemplateSectionItem: userTemplateSectionItem,
      ),
    );
  }

  @override
  _NewUserTemplateSectionItemPageState createState() =>
      _NewUserTemplateSectionItemPageState();
}

class _NewUserTemplateSectionItemPageState
    extends State<NewUserTemplateSectionItemPage> {
  // Form State Objects
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _description;

  @override
  void initState() {
    super.initState();
    if (widget.userTemplateSectionItem != null) {
      _title = widget.userTemplateSectionItem.title;
      _description = widget.userTemplateSectionItem.description;
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
        final id =
            widget.userTemplateSectionItem?.id ?? documentIdFromCurrentDate();
        final userTemplateSectionItem = UserTemplateSectionItem(
          id: id,
          title: _title,
          description: _description,
        );
        await database.setUserTemplateSectionItem(
            widget.userTemplateSection, userTemplateSectionItem);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        UserTemplateSectionItemsPage.show(
          context: context,
          userTemplate: widget.userTemplate,
          userTemplateSection: widget.userTemplateSection,
          userTemplateSectionItem: userTemplateSectionItem,
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
        initialValue: _description,
        validator: (value) =>
            value.isNotEmpty ? null : 'Description can\'t be empty',
        onSaved: (value) => _description = value,
      ),
    ];
  }
}
