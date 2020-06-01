import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:quickspecpro/services/firestore_database.dart';
import 'package:quickspecpro/routing/router.gr.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';
import 'package:quickspecpro/shared/text/icon_header_text.dart';
import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/shared/platform_alert_dialog.dart';
import 'package:quickspecpro/shared/platform_exception_alert_dialog.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({
    Key key,
    this.contact,
  }) : super(key: key);
  final Contact contact;

  static Future<void> show(BuildContext context,
      {Contact contact}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newContactPage,
      arguments: NewContactPageArguments(
           contact: contact),
    );
  }

  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  // Form State Objects
  final _formKey = GlobalKey<FormState>();
  String _fullName;
  String _emailAddress;
  String _phoneNumber;

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      _fullName = widget.contact.fullName;
      _emailAddress = widget.contact.emailAddress;
      _phoneNumber = widget.contact.phoneNumber;
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
        final contact = await database.contactsStream().first;
        final allLowerCaseNames =
            contact.map((contact) => contact.fullName.toLowerCase()).toList();
        if (widget.contact != null) {
          allLowerCaseNames.remove(widget.contact.fullName.toLowerCase());
        }
        if (allLowerCaseNames.contains(_fullName.toLowerCase())) {
          PlatformAlertDialog(
            title: 'Contact Already Used',
            content: 'Please Enter A Different Contact Name',
            defaultActionText: 'OK',
          ).show(context);
        } else {
          final id = widget.contact?.id ?? documentIdFromCurrentDate();
          final contact = Contact(
            id: id,
            fullName: _fullName,
            emailAddress: _emailAddress,
            phoneNumber: _phoneNumber,
          );
          await database.setContact(contact);
          Navigator.of(context).pop();
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
              Container(
                width: 185,
                child: IconHeaderText(
                  icon: Icons.supervised_user_circle,
                  headerText: widget.contact == null ? 'New Contact' : 'Update Contact',
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Enter your contact details below',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(223, 128, 87, 1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildForm(),
                ),
              ),
              SizedBox(height: 10.0),
              RaisedButton.icon(
                elevation: 2,
                textColor: Colors.white,
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: Text('Save'),
                color: Colors.green,
                onPressed: _submit,
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
        decoration: InputDecoration(labelText: 'Full Name'),
        keyboardAppearance: Brightness.light,
        initialValue: _fullName,
        validator: (value) => value.isNotEmpty ? null : 'Name can\'t be empty',
        onSaved: (value) => _fullName = value,
      ),
      SizedBox(height: 16),
      TextFormField(
        decoration: InputDecoration(labelText: 'Email Address'),
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.emailAddress,
        initialValue: _emailAddress,
        validator: (value) => value.isNotEmpty ? null : 'Email can\'t be empty',
        onSaved: (value) => _emailAddress = value,
      ),
      SizedBox(height: 16),
      TextFormField(
        decoration: InputDecoration(labelText: 'Phone Number'),
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.phone,
        initialValue: _phoneNumber,
        validator: (value) =>
            value.isNotEmpty ? null : 'Description can\'t be empty',
        onSaved: (value) => _phoneNumber = value,
      ),
      SizedBox(height: 24),
    ];
  }
}
