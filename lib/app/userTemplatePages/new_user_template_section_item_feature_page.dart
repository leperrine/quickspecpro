import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item_feature.dart';
import 'package:quickspecpro/app/userTemplatePages/user_template_section_item_features_page.dart';
import 'package:quickspecpro/routing/router.gr.dart';

import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';

class NewUserTemplateSectionItemFeaturePage extends StatefulWidget {
  const NewUserTemplateSectionItemFeaturePage({
    Key key,
    this.userTemplateSection,
    this.userTemplateSectionItem,
    this.userTemplateSectionItemFeature,
  }) : super(key: key);
  final UserTemplateSection userTemplateSection;
  final UserTemplateSectionItem userTemplateSectionItem;
  final UserTemplateSectionItemFeature userTemplateSectionItemFeature;

  static Future<void> show(
    BuildContext context, {
    UserTemplateSection userTemplateSection,
    UserTemplateSectionItem userTemplateSectionItem,
    UserTemplateSectionItemFeature userTemplateSectionItemFeature,
  }) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(Router.newUserTemplateSectionItemFeaturePage,
            arguments: NewUserTemplateSectionItemFeaturePageArguments(
              userTemplateSection: userTemplateSection,
              userTemplateSectionItem: userTemplateSectionItem,
              userTemplateSectionItemFeature: userTemplateSectionItemFeature,
            ));
  }

  @override
  _NewUserTemplateSectionItemFeaturePageState createState() =>
      _NewUserTemplateSectionItemFeaturePageState();
}

class _NewUserTemplateSectionItemFeaturePageState
    extends State<NewUserTemplateSectionItemFeaturePage> {
  // Form State Objects
  final _formKey = GlobalKey<FormState>();
  String _featureName;
  String _featureValues;

  @override
  void initState() {
    super.initState();
    if (widget.userTemplateSectionItemFeature != null) {
      _featureName = widget.userTemplateSectionItemFeature.featureName;
      _featureValues = widget.userTemplateSectionItemFeature.featureValues.join(',');
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
        final userTemplateSectionItemFeature = UserTemplateSectionItemFeature(
          featureName: _featureName,
          featureValues: _featureValues.split(','),
        );
        await database.setUserTemplateSectionItemFeature(
          userTemplateSection: widget.userTemplateSection,
          userTemplateSectionItem: widget.userTemplateSectionItem,
          userTemplateSectionItemFeature: userTemplateSectionItemFeature,
        );
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        UserTemplateSectionItemFeaturesPage.show(
          context: context,
          userTemplateSection: widget.userTemplateSection,
          userTemplateSectionItem: widget.userTemplateSectionItem,
          userTemplateSectionItemFeature: userTemplateSectionItemFeature,
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
        decoration: InputDecoration(labelText: 'Feature Name'),
        keyboardAppearance: Brightness.light,
        initialValue: _featureName,
        validator: (value) => value.isNotEmpty ? null : 'Title can\'t be empty',
        onSaved: (value) => _featureName = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Feature Values', helperText: 'seperate values with a comma'),
        keyboardAppearance: Brightness.light,
        initialValue: _featureValues,
        validator: (value) =>
            value.isNotEmpty ? null : 'Description can\'t be empty',
        onSaved: (value) => _featureValues = value,
      ),
    ];
  }
}
