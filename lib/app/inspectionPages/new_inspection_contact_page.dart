import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:quickspecpro/app/contactPages/contact_list_tile.dart';
import 'package:quickspecpro/app/inspectionPages/inspection_form_next_button_green.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_date_page.dart';

import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';
import 'package:quickspecpro/shared/empty_content.dart';

import 'package:quickspecpro/shared/list_items_builder.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';

class NewInspectionContactPage extends StatefulWidget {
  NewInspectionContactPage({
    Key key,
    this.contact,
  }) : super(key: key);
  final Contact contact;

  static Future<void> show(BuildContext context, {Contact contact}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newInspectionContactPage,
      arguments: NewInspectionContactPageArguments(contact: contact),
    );
  }

  @override
  _NewInspectionContactPageState createState() => _NewInspectionContactPageState();
}

class _NewInspectionContactPageState extends State<NewInspectionContactPage> {
  // Form State Objects
  final _formKey = GlobalKey<FormState>();

  // Form Text Controllers
  var _idController = TextEditingController();
  var _fullNameController = TextEditingController();
  var _emailAddressController = TextEditingController();
  var _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      _idController.text = widget.contact.id;
      _fullNameController.text = widget.contact.fullName;
      _emailAddressController.text = widget.contact.emailAddress;
      _phoneNumberController.text = widget.contact.phoneNumber;
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _fullNameController.dispose();
    _emailAddressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void formFieldOnChange() {
    if (_fullNameController.text != widget.contact.fullName ||
        _emailAddressController.text != widget.contact.emailAddress ||
        _phoneNumberController.text != widget.contact.phoneNumber) {
      setState(() {
        _idController.text = 'empty';
      });
    }
  }

  void updateFormState(Contact contact) {
    setState(() {
      _idController.text = contact.id;
      _fullNameController.text = contact.fullName;
      _emailAddressController.text = contact.emailAddress;
      _phoneNumberController.text = contact.phoneNumber;
    });
  }

  Future<void> _submit() async {
    print(_idController.text);
    if (_validateAndSaveForm()) {
      try {
        final database = Provider.of<FirestoreDatabase>(context, listen: false);
        if (_idController.text == 'empty') {
          final id = widget.contact?.id ?? documentIdFromCurrentDate();
          final newContact = Contact(
            id: id,
            fullName: _fullNameController.text,
            emailAddress: _emailAddressController.text,
            phoneNumber: _phoneNumberController.text,
          );
          await database.setContact(newContact);
          NewInspectionDatePage.show(context, contact: newContact);
          print(newContact.toString());
        } else {
          final Contact updatedContact = Contact(
            id: _idController.text,
            fullName: _fullNameController.text,
            emailAddress: _emailAddressController.text,
            phoneNumber: _phoneNumberController.text,
          );
          NewInspectionDatePage.show(context, contact: updatedContact);
          print(updatedContact.id);
        }
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Operation Failed',
          exception: e,
        ).show(context);
      }
    }
  }

  Future<Contact> _showBottomModalSheet() async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          final database =
              Provider.of<FirestoreDatabase>(context, listen: false);
          return StreamBuilder<List<Contact>>(
            stream: database.contactsStream(),
            builder: (context, snapshot) {
              return ListItemsBuilder<Contact>(
                snapshot: snapshot,
                itemBuilder: (context, contact) => StatefulBuilder(
                  builder: (BuildContext context, StateSetter updateContact) {
                    return ContactListTile(
                      contact: contact,
                      onTap: () {
                        updateFormState(contact);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                'Who is the inspection for?',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(223, 128, 87, 1),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildForm(),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () => NewInspectionDatePage.show(context),
                  ),
                  InspectionFormNextButtonGreen(onPressed: _submit),
                ],
              ),
              SizedBox(height: 10),
              FlatButton(
                onPressed: _showBottomModalSheet,
                child: Text('Choose from Existing Contacts'),
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
        controller: _fullNameController,
        decoration: InputDecoration(labelText: 'Full Name'),
        keyboardAppearance: Brightness.light,
        validator: (value) => value.isNotEmpty ? null : 'Name can\'t be empty',
        onChanged: (text) {
          if (text != _fullNameController.text) {
            setState(() {
              _idController.text = 'empty';
              print(_idController.text);
            });
          }
        },
        onSaved: (value) => _fullNameController.text = value,
      ),
      SizedBox(height: 8),
      TextFormField(
        controller: _emailAddressController,
        decoration: InputDecoration(labelText: 'Email Address'),
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => value.isNotEmpty ? null : 'Email can\'t be empty',
        onChanged: (text) {
          if (text != _emailAddressController.text) {
            setState(() {
              _idController.text = 'empty';
               print(_idController.text);
            });
          }
        },
        onSaved: (value) => _emailAddressController.text = value,
      ),
      SizedBox(height: 8),
      TextFormField(
        controller: _phoneNumberController,
        decoration: InputDecoration(labelText: 'Phone Number'),
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.phone,
        validator: (value) =>
            value.isNotEmpty ? null : 'Description can\'t be empty',
        onChanged: (text) {
          if (text != _phoneNumberController.text) {
            setState(() {
              _idController.text = 'empty';
              print(_idController.text);
            });
          }
        },
        onSaved: (value) => _phoneNumberController.text = value,
      ),
      SizedBox(height: 16),
    ];
  }
}
