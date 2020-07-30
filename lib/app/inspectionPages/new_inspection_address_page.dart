import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:quickspecpro/app/inspectionPages/inspection_form_next_button_green.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_choose_template_page.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';
import 'package:quickspecpro/app/models/inspection/inspection.dart';
import 'package:quickspecpro/app/models/inspection/inspection_address.dart';

import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';
import 'package:quickspecpro/shared/text/orange_header_text.dart';

class NewInspectionAddressPage extends StatefulWidget {
  const NewInspectionAddressPage({
    Key key,
    this.contact,
    this.inspection,
    this.inspectionAddress,
  }) : super(key: key);
  final Contact contact;
  final Inspection inspection;
  final InspectionAddress inspectionAddress;

  static Future<void> show(BuildContext context,
      {Inspection inspection, Contact contact}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newInspectionAddressPage,
      arguments: NewInspectionAddressPageArguments(
          inspection: inspection, contact: contact),
    );
  }

  @override
  _NewInspectionAddressPageState createState() =>
      _NewInspectionAddressPageState();
}

class _NewInspectionAddressPageState extends State<NewInspectionAddressPage> {
  // Form State Objects
  final _formKey = GlobalKey<FormState>();
  String _streetAddress;
  String _city;
  String _state;
  String _zipCode;

  @override
  void initState() {
    super.initState();
    if (widget.inspectionAddress != null) {
      _streetAddress = widget.inspectionAddress.streetAddress;
      _city = widget.inspectionAddress.city;
      _state = widget.inspectionAddress.state;
      _zipCode = widget.inspectionAddress.zipCode;
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
        final newInspectionAddress = InspectionAddress(
          streetAddress: _streetAddress,
          city: _city,
          state: _state,
          zipCode: _zipCode,
        );
        final inspection = Inspection(
          date: widget.inspection?.date ?? null,
          address: newInspectionAddress,
        );
        NewInspectionChooseTemplatePage.show(
          context,
          contact: widget.contact,
          inspection: inspection,
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
              OrangeHeaderText(
                text: 'Where is the inspection?',
              ),
              SizedBox(height: 10.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildForm(),
                ),
              ),
              SizedBox(height: 10.0),
              //MediaButton(uid: widget.userSnapshot.data.uid, userTemplateId: widget.userTemplate.id),
              InspectionFormNextButtonGreen(onPressed: _submit),
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
        decoration: InputDecoration(labelText: 'Street Address'),
        keyboardAppearance: Brightness.light,
        initialValue: _streetAddress,
        validator: (value) =>
            value.isNotEmpty ? null : 'Street Address can\'t be empty',
        onSaved: (value) => _streetAddress = value,
      ),
      SizedBox(height: 8),
      TextFormField(
        decoration: InputDecoration(labelText: 'City'),
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.text,
        initialValue: _city,
        validator: (value) => value.isNotEmpty ? null : 'City can\'t be empty',
        onSaved: (value) => _city = value,
      ),
      SizedBox(height: 8),
      TextFormField(
        decoration: InputDecoration(labelText: 'State'),
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.text,
        initialValue: _state,
        validator: (value) => value.isNotEmpty ? null : 'State can\'t be empty',
        onSaved: (value) => _state = value,
      ),
      SizedBox(height: 8),
      TextFormField(
        decoration: InputDecoration(labelText: 'Zip Code'),
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.number,
        initialValue: _zipCode,
        validator: (value) =>
            value.isNotEmpty ? null : 'Zip Code can\'t be empty',
        onSaved: (value) => _zipCode = value,
      ),
      SizedBox(height: 16),
    ];
  }
}
