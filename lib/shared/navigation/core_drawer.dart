import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickspecpro/app/accountPages/account_page.dart';
import 'package:quickspecpro/app/settingsPages/settings_page.dart';
import 'package:quickspecpro/app/templateLibraryPages/template_library_page.dart';
import 'package:quickspecpro/services/firebase_auth_service.dart';

class CoreDrawer extends StatelessWidget {
  const CoreDrawer({Key key}) : super(key: key);

  Future<void> _signout(BuildContext context) async {
    try {
      final auth = Provider.of<FirebaseAuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Account'),
            onTap: () {
              Navigator.of(context).pop();
              AccountPage.show(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              SettingsPage.show(context);
            },
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Template Catalog'),
              onTap: () {
                Navigator.of(context).pop();
                TemplateLibraryPage.show(context);
              }),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
            onTap: () => _signout(context),
          ),
        ],
      ),
    );
  }
}
