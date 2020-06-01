import 'package:flutter/material.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';

class ContactListTile extends StatelessWidget {
  ContactListTile({this.contact, this.onTap});
  final Contact contact;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(userTemplate.coverPhoto),
      title: contact.fullName != null
          ? Text(contact.fullName)
          : Text('Title Not Found'),
      trailing: contact.emailAddress != null
          ? Text(contact.emailAddress)
          : Text('Email Not Found'),
      onTap: onTap,
    );
  }
}